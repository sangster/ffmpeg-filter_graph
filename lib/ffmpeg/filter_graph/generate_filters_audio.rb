# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    ACompressor: {
      optional: [:level_in, :threshold, :ratio, :attack, :release, :makeup,
                 :knee, :link, :detection, :mix]
    },
    ACrossFade: {
      required: [:curve1, :curve2],
      optional: [:nb_samples, :duration, :overlap]
    },
    ADelay: {
      required: [:delays]
    },
    AEcho: {
      required: [:in_gain, :out_gain, :delays, :decays]
    },
    AEmphasis: {
      required: [:level_in, :level_out, :type],
      optional: [:mode]
    },
    AEval: {
      required: [:exprs],
      optional: [:channel_layout],
      options_string: -> { [exprs, join_options(:channel_layout)].compact.join(':') }
    },
    AFade: {
      required: [:curve],
      optional: [:type, :start_sample, :nb_samples, :start_time, :duration]
    },
    AffTFilt: {
      optional: [:real, :imag, :win_size, :win_func, :overlap]
    },
    AFormat: {
      optional: [:channel_layouts, :sample_fmts, :sample_rates]
    },
    AGate: {
      optional: [:level_in, :range, :threshold, :ratio, :attack, :release,
                 :makeup, :knee, :detection, :line]
    },
    ALimiter: {
      optional: [:level_in, :level_out, :limit, :attack, :release, :asc,
                 :asc_level, :level]
    },
    AllPass: {
      required: [:frequency, :width_type, :width]
    },
    AMerge: {
      optional: [:inputs]
    },
    AMix: {
      optional: [:inputs, :duration, :dropout_transition]
    },
    APad: {
      optional: [:packet_size, :pad_len, :whole_len]
    },
    APhaser: {
      optional: [:in_gain, :out_gain, :delay, :decay, :speed, :type]
    },
    APulsator: {
      required: [:amount],
      optional: [:level_in, :level_out, :mode, :offset_l, :offset_r, :width,
                 :timing, :bpm, :ms, :hz]
    },

    # TODO AResample: { },

    ASetNSamples: {
      optional: [:nb_out_samples, :pad]
    },
    ASetRate: {
      optional: [:sample_rate]
    },
    AShowInfo: {},
    AStats: {
      optional: [:length, :metadata, :reset]
    },
    ASyncTs: {
      optional: [:compensate, :min_delta, :first_pts]
    },
    ATempo: {
      optional: [:tempo],
      options_string: -> { tempo }
    },

    # TODO ATrim: {},

    BandPass: {
      required: [:width_type, :width],
      optional: [:frequency, :csg]
    },
    BandReject: {
      required: [:width_type, :width],
      optional: [:frequency]
    },
    Bass: {
      required: [:gain, :width_type, :width],
      optional: [:frequency]
    },
    BiQuad: {
      required: [:b0, :b1, :b2, :a0, :a1, :a2]
    },
    Bs2b: {
      required: [:profile, :fcut, :feed]
    },
    ChannelMap: {
      required: [:map],
      optional: [:channel_layout]
    },
    ChannelSplit: {
      optional: [:channel_layout]
    },
    Chorus: {
      required: [:delays, :decays, :speeds, :depths],
      optional: [:in_gain, :out_gain]
    },

    # TODO Compand
    # TODO CompensationDelay
    # TODO DcShift
    # TODO DynAudNorm

    Earwax: {},

    # TODO Equalizer
    # TODO ExtraStereo
    # TODO FirEqualizer
    # TODO Flanger
    # TODO HighPass
    # TODO Join
    # TODO Ladspa
    # TODO LowPass

    Pan: {
      optional: [:channel_layout, :outputs],
      options_string: -> { "#{channel_layout}| #{outputs.join(' | ')}" }
    },
    ReplayGain: {},
    Resample: {},

    # TODO RubberBand

    SideChainCompress: {
      optional: [:level_in, :threshold, :ratio, :attack, :release, :makeup,
                 :knee, :link, :detection, :level_sc, :mix]
    },
    SideChainGate: {
      optional: [:level_in, :range, :threshold, :ratio, :attack, :release,
                 :makeup, :knee, :link, :detection, :level_sc]
    },
    SilenceDetect: {
      optional: [:duration, :noise]
    },

    # TODO SilenceRemove
    # TODO Sofalizer
    # TODO StereoTools
    # TODO StereoWiden
    # TODO Scale_Npp
    # TODO Select
    # TODO Treble

    Tremolo: {
      optional: [:f, :d]
    },
    Vibrato: {
      optional: [:f, :d]
    },
    Volume: {
      optional: [:volume, :precision, :replaygain, :replaygain_preamp, :eval]
    },
    VolumeDetect: {},
  }.each do |class_name, opts|
      FilterFactory.new(
        class_name,
        opts[:required],
        opts[:optional],
        &opts[:options_string]
      ).create_class_in(self)
  end
end
