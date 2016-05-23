module FFmpeg::FilterGraph
  class Graph
    attr_accessor :chains, :outputs

    def initialize(chains: [], outputs: [])
      self.chains = chains
      self.outputs = outputs.map { |pad| Pad.out(pad) }
    end

    def to_s
      [
        chains.map(&:to_s).join('; '),
        outputs.map(&:to_s).join(''),
      ].join('')
    end
  end
end
