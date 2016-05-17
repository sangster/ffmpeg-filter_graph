# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
  }.each do |class_name, opts|
      FilterFactory.new(
        class_name,
        opts[:required],
        opts[:optional],
        &opts[:options_string]
      ).create_class_in(self)
  end
end
