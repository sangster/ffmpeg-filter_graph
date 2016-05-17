# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    Concat: {
      optional: [:n, :v, :a]
    },
    ASplit: {
      optional: [:number],
      options_string: -> { number.to_s }
    },
  }.each do |class_name, opts|
      FilterFactory.new(
        class_name,
        opts[:required],
        opts[:optional],
        &opts[:options_string]
      ).create_class_in(self)
  end
end
