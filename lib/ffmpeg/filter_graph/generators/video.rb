# @see https://ffmpeg.org/ffmpeg-filters.html
module FFmpeg::FilterGraph
  {
    AlphaExtract: {},

    AlphaMerge: {},

    Ass: {
      optional: [:shaping]
    },

    AtaDenoise: {
      optional: [:'0a', :'0b', :'1a', :'1b', :'2a', :'2b', :s]
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
      optional: [:'0m', :'1m', :'2m', :'3m',
                 :'0rdiv', :'1rdiv', :'2rdiv', :'3rdiv',
                 :'0bias', :'1bias', :'2bias', :'3bias']
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
  }.each do |class_name, opts|
    FilterFactory.create(class_name, opts).create_class_in(self)
  end
end
