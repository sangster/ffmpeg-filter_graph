module FFmpeg::FilterGraph
  module Helper
    CHANNELS = %w(FL FR FC LFE RL RR)

    def graph(*args); Graph.new(*args) end
    def chain(*args); Chain.new(*args) end

    # Filter-specific helpers will be added to this module by default, by the
    # FilterFactory class.

    def surround_channels(prefix = '', *channels)
      channels = CHANNELS if channels.empty?
      channels.map(&:to_s).map(&:upcase).map { |c| "#{prefix}#{c}" }
    end

    # @return the number of channels in the given channel layout
    def count_channels(ch)
      case ch
      when Fixnum   then ch
      when '7.1'    then 8
      when '6.1'    then 7
      when '5.1'    then 6
      when '4.1'    then 5
      when '3.1'    then 4
      when '2.1'    then 3
      when 'stereo' then 2
      when 'mono'   then 1
      else fail 'unknown layout'
      end
    end
  end
end
