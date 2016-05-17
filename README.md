# Ffmpeg::FilterGraph

The purpose of this gem is to help you create complex filter-graphs for FFmpeg.
In a sense, this gem is really a "string factory", as it's main output is a
single string you can pass as the argument to `ffmpeg`'s `-filter_complex`
command-line argument.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ffmpeg-filter_graph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffmpeg-filter_graph

## Usage

```ruby
# This class adds an additional audio stream to a given multimedia file. The
# new audio stream will contain a copy of the film's soundtrack, with the
# commentary track mixed into the rear speakers (for a nice Statler and Waldorf
# experience). To make the commentary more audible, with "duck" the soundtrack
# before mixing in the commentary.
class AddCommentary
  include FFmpeg::Filters::Helper

  # Surround-sound prefixes
  Soundtrack = 'c'
  CommentaryMix = 'r'

  # ffmpeg notation
  SoundtrackVideo = '1:v'
  SoundtrackAudio = '1:a'
  CommentaryAudio = '2:a'

  def initialize(media_container_path, commentary_audio_path, output_path)
    @media_container_path = media_container_path
    @commentary_audio_path = commentary_audio_path
    @output_path = output_path
  end

  def call
    filter_graph = create_filter_graph

    spawn('ffmpeg', '-i', @media_container_path, '-i', @commentary_audio_path,
          '-filter_complex', filter_graph.to_s,
          '-map', SoundtrackVideo, '-map', SoundtrackAudio,
          '-map', '[#{filter_graph.outputs.first}]',
          @output_path)
  end

  private

  def create_filter_graph
    graph(
      outputs: 'CommentaryTrack',

      chains: [
        # We need two copies for the mix, and one copy for the audo-ducking
        chain(
          inputs: [CommentaryAudio],
          filters: a_split(number: 3),
          outputs: %w(RLcom RRcom Ducker)
        ),

        # Auto-duck the soundtrack, so we can hear the commentary
        chain(
          inputs: [SoundtrackAudio, 'Ducker'],
          filters: [
            side_chain_compress(attack: 50, release: 200),
            channel_split(channel_layout: '5.1')
          ],
          outputs: surround_channels(CommentaryMix),
        ),

        # Merge commentary into rear channels
        chain(
          inputs: surround_channels(CommentaryMix, :rl) << 'RLcom',
          filters: mono_mix,
          outputs: %w(RLmix)
        ),
        chain(
          inputs: surround_channels(CommentaryMix, :rr) << 'RRcom',
          filters: mono_mix,
          outputs: %w(RRmix)
        ),
        chain(
          inputs: surround_channels(CommentaryMix, :fl, :fr, :fc, :lfe) + %w(RLmix RRmix),
          filters: [a_merge(inputs: 6)]
        ),
      ]
    )
  end

  # You can easily encapsulate a group of filters with private methods, for
  # better readability.
  def mono_mix
    [a_merge, pan(channel_layout: 'mono', outputs: ["c0 = c0 + c1"])]
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/sangster/ffmpeg-filter_graph.

