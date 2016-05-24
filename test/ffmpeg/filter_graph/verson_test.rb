require 'test_helper'

module FFmpeg::FilterGraph
  class VersionTest < UnitTest
    def test_version_number
      refute_nil VERSION
    end
  end
end
