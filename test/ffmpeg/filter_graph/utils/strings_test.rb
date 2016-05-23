require 'test_helper'

module FFmpeg::FilterGraph::Utils
  class StringsTest < UnitTest
    def setup
      @test_mod = Object.new.tap { |obj| obj.extend(Strings) }
    end

    def test_underscore
      assert_equal 'foo_bar', @test_mod.underscore('fooBar')
      assert_equal 'initial_capital', @test_mod.underscore('InitialCapital')
      assert_equal 'a_abc', @test_mod.underscore('AAbc')
    end
  end
end
