module FFmpeg::FilterGraph::Pads
  class Input < Pad
    def to_s
      name
    end
  end
end
