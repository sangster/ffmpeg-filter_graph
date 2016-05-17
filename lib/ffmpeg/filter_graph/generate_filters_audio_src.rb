# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    # TODO ABuffer
    AEvalSrc: {
      required: [:exprs],
      optional: [:sample_rate, :duration, :channel_layout, :nb_samples],
      options_string: -> { "#{exprs}:#{join_options(:duration, :sample_rate, :channel_layout, :nb_samples)}" }
    },
    ANullSrc: {
      optional: [:channel_layout, :sample_rate, :nb_samples]
    },
    # TODO Flite
    # TODO ANoiseSrc
    # TODO Sine
  }.each do |class_name, opts|
      FilterFactory.new(
        class_name,
        opts[:required],
        opts[:optional],
        &opts[:options_string]
      ).create_class_in(self)
  end
end
