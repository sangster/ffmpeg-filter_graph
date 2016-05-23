require 'test_helper'

module FFmpeg::FilterGraph
  class PadTest < UnitTest
    def test_to_s
      assert_equal '[myname]', Pad.new('myname').to_s
    end
  end
end
