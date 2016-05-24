require 'test_helper'

module FFmpeg::FilterGraph
  module Pads
    class OutpadTest < UnitTest
      def test_to_s
        assert_equal '[output]', Outpad.new('output').to_s
      end
    end
  end
end
