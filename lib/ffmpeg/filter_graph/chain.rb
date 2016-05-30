module FFmpeg::FilterGraph
  # A Chain represents a pipeline of {Filter}s, with zero or more inputs and
  # outputs.
  # @see https://ffmpeg.org/ffmpeg-filters.html#Filtergraph-syntax-1
  class Chain
    attr_accessor :inputs, :outputs, :filters

    def initialize(inputs: [], outputs: [], filters: [])
      self.inputs = Array(inputs).map { |pad| Pad.in(pad) }
      self.outputs = Array(outputs).map { |pad| Pad.out(pad) }
      self.filters = Array(filters).flatten.compact
    end

    def to_s
      "#{join(inputs)} #{join(filters, ', ')} #{join(outputs)}".strip
    end

    private

    def join(arr, sep = '')
      arr.map(&:to_s).join(sep)
    end
  end
end
