module FFmpeg::FilterGraph
  class Pad
    attr_reader :name, :writer, :reader

    def initialize(name, writer: nil, reader: nil)
      fail ArgumentError, 'name cannot be nil' if name.nil?

      @name = name
      @writer = writer
      @reader = reader
    end

    def to_s
      "[#{name}]"
    end

    def writer?
      !!writer
    end

    def reader?
      !!reader
    end
  end
end
