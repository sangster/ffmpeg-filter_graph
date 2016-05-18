# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    AMovie: {
      required: [:filename],
      optional: [:format_name, :seek_point, :streams, :stream_index, :loop]
    },

    Movie: {
      required: [:filename],
      optional: [:format_name, :seek_point, :streams, :stream_index, :loop]
    },
  }.each do |class_name, opts|
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
