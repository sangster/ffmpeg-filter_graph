module FFmpeg::FilterGraph
  class Chain
    attr_accessor :inputs, :outputs, :filters

    def initialize(inputs: [], outputs: [], filters: [])
      self.inputs = inputs
      self.outputs = outputs
      self.filters = Array(filters).flatten.compact
    end

    def to_s
      "#{join(inputs)} #{filters.map(&:to_s).join(', ')} #{join(outputs)}"
    end

    private

    def join(arr)
      arr.map { |i| "[#{i}]" }.join
    end
  end
end
