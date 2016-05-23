module FFmpeg::FilterGraph
  module Pads
    class Input < Pad
      def to_s
        name
      end
    end
  end
end
