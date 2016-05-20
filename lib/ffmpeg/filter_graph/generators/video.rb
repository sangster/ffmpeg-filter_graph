# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    AlphaExtract: {},

    AlphaMerge: {},

    Ass: {
      optional: [:shaping]
    },

    AtaDenoise: {
      optional: [:_0a, :_0b, :_1a, :_1b, :_2a, :_2b, :s]
    },

    Bbox: {
      optional: [:min_val]
    },

    BlackDetect: {
      optional: [:black_min_duration, :picture_black_ratio_th, :pixel_black_th]
    },

    BlackFrame: {
      optional: [:amount, :threshold]
    },

    # TODO blend
    # TODO tblend

    BWDiF: {
      optional: [:mode, :parity, :deint]
    },

    BoxBlur: {
      optional: [:luma_radius, :luma_power, :chroma_radius, :chroma_power,
                 :alpha_radius, :alpha_power]
    },

    ChromaKey: {
      required: [:color],
      optional: [:similarity, :blend, :yuv]
    },

    CieScope: {
      required: [:system, :cie, :gamuts, :intensity, :contrast],
      optional: [:size, :corrgamma, :showwite, :gamma]
    },

    CodecView: {
      optional: [:mv, :qp]
    },

    ColorBalance: {
      optional: [:rs, :gs, :bs, :rm, :gm, :bm, :rh, :gh, :bh]
    },

    ColorKey: {
      required: [:color],
      optional: [:similarity, :blend]
    },

    ColorLevels: {
      optional: [:rimin, :gimin, :bimin, :aimin,
                 :rimax, :gimax, :bimax, :aimax,
                 :romin, :gomin, :bomin, :aomin,
                 :romax, :gomax, :bomax, :aomax]
    },

    ColorChannelMixer: {
      optional: [:rr, :rg, :rb, :ra,
                 :gr, :gg, :gb, :ga,
                 :br, :bg, :bb, :ba,
                 :ar, :ag, :ab, :aa]
    },

    ColorMatrix: {
      required: [:src, :dst]
    },

    ColorSpace: {
      optional: [:all, :space, :trc, :prm, :rng, :format, :fast, :dither,
                 :wpadapt]
    },

    Convolution: {
      optional: [:_0m, :_1m, :_2m, :_3m,
                 :_0rdiv, :_1rdiv, :_2rdiv, :_3rdiv,
                 :_0bias, :_1bias, :_2bias, :_3bias]
    },

    Copy: {},

    CoreImage: {
      optional: [:list_filters, :filter, :output_rect]
    },

    Crop: {
      required: [:out_w, :out_h],
      optional: [:x, :y, :keep_aspect]
    },

    CropDetect: {
      optional: [:limit, :round, :reset_count]
    },

    Curves: {
      optional: [:preset, :master, :red, :green, :blue, :all, :psfile]
    },

    DataScope: {
      required: [:size, :x, :y, :mode, :axis]
    },

    DctDnoiz: {
      optional: [:sigma, :overlap, :expr, :n]
    },

    Deband: {
      required: [:direction],
      optional: [:_1thr, :_2thr, :_3thr, :_4thr, :range, :blur]
    },

    Decimate: {
      optional: [:cycle, :dupthresh, :scthresh, :blockx, :blocky, :ppsrc,
                 :chroma]
    },

    Deflate: {
      optional: [:threshold0, :threshold1, :threshold2, :threshold3]
    },

    Dejudder: {
      optional: [:cycle]
    },

    Delogo: {
      required: [:x, :y, :w, :h],
      optional: [:band, :show]
    },

    Deshake: {
      optional: [:x, :y, :w, :h, :rx, :ry, :edge, :blocksize, :contrast,
                 :search, :filename, :opencl]
    },

    Detelecine: {
      optional: [:first_field, :pattern, :start_frame]
    },

    Dilation: {
      optional: [:threshold0, :threshold1, :threshold2, :threshold3,
                 :coordinates]
    },

    Displace: {
      optional: [:edge]
    },

    DrawBox: {
      optional: [:x, :y, :width, :height, :thickness, :color]
    },

    DrawGraph: {
      required: [:m1, :fg1, :m2, :fg2, :m3, :fg3, :m4, :fg4, :min, :max, :bg],
      optional: [:mode, :slide, :size]
    },

    ADrawGraph: {
      required: [:m1, :fg1, :m2, :fg2, :m3, :fg3, :m4, :fg4, :min, :max, :bg],
      optional: [:mode, :slide, :size]
    },

    DrawGrid: {
      required: [:color],
      optional: [:x, :y, :width, :height, :thickness]
    },

    DrawText: {
      optional: [:box, :boxborderw, :boxcolor, :borderw, :bordercolor,
                 :expansion, :fix_bounds, :fontcolor, :fontcolor_expr, :font,
                 :fontfile, :alpha, :fontsize, :text_shaping, :ft_load_flags,
                 :shadowcolor, :shadowx, :shadowy, :start_number, :tabsize,
                 :timecode, :timecode_rate, :text, :textfile, :reload, :x, :y]
    },

    EdgeDetect: {
      optional: [:low, :high, :mode],
    },

    Eq: {
      optional: [:contrast, :brightness, :saturation, :gamma, :gamma_r,
                 :gamma_g, :gamma_b, :gamma_weight, :eval]
    },

    ExtractPlanes: {
      required: [:planes]
    },

    Elbg: {
      required: [:pal8],
      optional: [:codebook_length, :nb_steps, :seed]
    },

    Fade: {
      optional: [:type, :start_frame, :nb_frames, :alpha, :start_time,
                 :duration, :color]
    },

    # TODO fftfilt (has all-caps options)

    Field: {
      required: [:type]
    },

    FieldHint: {
      required: [:hint],
      optional: [:mode]
    },

    FieldMatch: {
      optional: [:order, :mode, :ppsrc, :field, :mchroma, :y0, :y1, :scthresh,
                 :combmatch, :combdbg, :cthresh, :chroma, :blockx, :blocky,
                 :combpel]
    },

    FieldOrder: {
      optional: [:order]
    },

    Fifo: {},

    AFifo: {},

    # TODO find_rect
    # TODO cover_rect

    Format: {
      required: [:pix_fmts],
    },

    Fps: {
      optional: [:fps, :round, :start_time]
    },

    FramePack: {
      optional: [:format]
    },

    FrameRate: {
      optional: [:fps, :interp_start, :interp_end, :scene, :flag]
    },

    FrameStep: {
      optional: [:step]
    },
  }.each do |class_name, opts|
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
