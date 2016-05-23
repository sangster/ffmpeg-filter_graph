module FFmpeg::FilterGraph
  class Pad
    attr_reader :name

    def self.in(pad)
      case pad
      when Pad then pad
      else
        if /\A\d/ =~ pad.to_s
          Pads::Input.new(pad.to_s)
        else
          Pads::Inpad.new(pad.to_s)
        end
      end
    end

    def self.out(pad)
      case pad
      when Pad then pad
      else Pads::Outpad.new(pad.to_s)
      end
    end

    def initialize(name)
      fail ArgumentError, 'name cannot be nil' if name.nil?

      @name = name
    end

    def to_s
      "[#{name}]"
    end
  end
end
