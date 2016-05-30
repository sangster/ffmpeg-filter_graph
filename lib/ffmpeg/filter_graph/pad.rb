module FFmpeg::FilterGraph
  # The base class for {Pads::Inpad inpads} and {Pads::Outpad outpads}.
  class Pad
    # the name to return in the output
    attr_reader :name

    # A factory method for creating {Pads::Inpad inpads}
    # @return [Pads::Inpad]
    def self.in(pad)
      case pad
      when Pads::Inpad then pad
      when Pads::Outpad then fail ArgumentError, 'cannot use Outpad as input'
      else Pads::Inpad.new(pad.to_s)
      end
    end

    # A factory method for creating {Pads::Outpad outpads}
    # @return [Pads::Outpad]
    def self.out(pad)
      case pad
      when Pads::Outpad then pad
      when Pads::Inpad then fail ArgumentError, 'cannot use Inpad as output'
      else Pads::Outpad.new(pad.to_s)
      end
    end

    def initialize(name)
      fail ArgumentError, 'name cannot be empty' if name.nil? || name.empty?

      @name = name
    end

    def to_s
      "[#{name}]"
    end
  end
end
