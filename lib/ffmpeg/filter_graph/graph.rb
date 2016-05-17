module FFmpeg::FilterGraph
  class Graph
    attr_accessor :chains, :outputs

    def initialize(chains: [], outputs: [])
      self.chains = chains
      self.outputs = outputs
    end

    def add_outputs(*pads)
      self.outputs.push(*pads.map(&:to_s))
    end

    def to_s
      [
        chains.map(&:to_s).join('; '),
        outputs.map { |o| "[#{o}]" }.join(''),
      ].join('')
    end
  end
end

