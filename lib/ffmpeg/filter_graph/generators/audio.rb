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

    Compand: {
      required: [:attack, :delay, :points],
      optional: [:softKnee, :gain, :volume, :delay]
    },

    CompensationDelay: {
      optional: [:mm, :cm, :m, :dry, :wet, :temp]
    },

    DcShift: {
      required: [:shift],
      optional: [:limitergain]
    },

    DynAudNorm: {
      optional: [:f, :g, :p, :m, :r, :n, :c, :b, :s]
    },

    Earwax: {},

    Equalizer: {
      required: [:frequency, :width_type, :width, :gain]
    },

    ExtraStereo: {
      optional: [:m, :c]
    },

    FirEqualizer: {
      required: [:gain_entry],
      optional: [:gain, :delay, :accuracy, :wfunc, :fixed, :multi]
    },

    Flanger: {
      optional: [:delay, :depth, :regen, :width, :speed, :shape, :phase, :interp]
    },

    HighPass: {
      required: [:width_type],
      optional: [:frequency, :poles, :width]
    },

    Join: {
      optional: [:inputs, :channel_layout, :map]
    },

    Ladspa: {
      required: [:file],
      optional: [:plugin, :controls, :sample_rate, :nb_samples, :duration]
    },

    LowPass: {
      required: [:width_type],
      optional: [:frequency, :poles, :width]
    },

    Pan: {
      optional: [:channel_layout, :outputs],
      options_string: -> { "#{channel_layout}| #{outputs.join(' | ')}" }
    },

    ReplayGain: {},

    Resample: {},

    RubberBand: {
      required: [:tempo, :pitch, :transient, :detector, :phase, :window,
                 :smoothing, :formant, :pitchq, :channels]
    },

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

    SilenceRemove: {
      optional: [:start_periods, :start_duration, :start_threshold,
                 :stop_periods, :stop_duration, :stop_threshold,
                 :leave_silence, :detection, :window]
    },

    Sofalizer: {
      required: [:sofa],
      optional: [:gain, :rotation, :evelation, :radius, :type, :speakers]
    },

    StereoTools: {
      optional: [:level_in, :level_out, :balance_in, :balance_out, :softclip,
                 :mutel, :muter, :phasel, :phaser, :mode, :slev, :sbal, :mlev,
                 :mpan, :base, :delay, :sclevel, :phase]
    },

    StereoWiden: {
      optional: [:delay, :feedback, :crossfeed, :drymix]
    },


    # TODO Scale_Npp
    # TODO Select

    Treble: {
      required: [:gain, :width_type, :width],
      optional: [:frequency]
    },

    Tremolo: {
      optional: [:f, :d]
    },

    Vibrato: {
      optional: [:f, :d]
    },

    Volume: {
      editable: true,
      optional: [:volume, :precision, :replaygain, :replaygain_preamp, :eval]
    },

    VolumeDetect: {},
  }.each do |class_name, opts|
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
