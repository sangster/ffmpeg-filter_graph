require 'test_helper'

module FFmpeg::FilterGraph
  module Pads
    class InpadTest < UnitTest
      def test_to_s
        assert_equal '[input]', Inpad.new('input').to_s
      end
    end
  end
end

