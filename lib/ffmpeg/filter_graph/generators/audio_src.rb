# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    ABuffer: {
      required: [:sample_rate, :sample_fmt, :channel_layout],
      optional: [:time_base, :channels]
    },

    AEvalSrc: {
      required: [:exprs],
      optional: [:sample_rate, :duration, :channel_layout, :nb_samples],
      options_string: -> { "#{exprs}:#{join_options(:duration, :sample_rate, :channel_layout, :nb_samples)}" }
    },

    ANullSrc: {
      optional: [:channel_layout, :sample_rate, :nb_samples]
    },

    Flite: {
      optional: [:list_voices, :nb_samples, :text, :textfile, :voice]
    },

    ANoiseSrc: {
      optional: [:sample_rate, :amplitude, :duration, :color, :seed, :nb_samples]
    },

    Sine: {
      optional: [:frequency, :beep_factor, :sample_rate, :duration,
                 :samples_per_frame]
    },
  }.each do |class_name, opts|
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
