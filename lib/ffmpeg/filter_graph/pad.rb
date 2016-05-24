module FFmpeg::FilterGraph
  class Pad
    attr_reader :name

    def self.in(pad)
      case pad
      when Pads::Outpad then fail ArgumentError, 'cannot use Outpad as input'
      when Pad then pad
      else Pads::Inpad.new(pad.to_s)
      end
    end

    def self.out(pad)
      case pad
      when Pads::Inpad then fail ArgumentError, 'cannot use Inpad as output'
      when Pad then pad
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
