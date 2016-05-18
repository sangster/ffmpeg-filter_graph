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
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
