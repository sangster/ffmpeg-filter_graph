require 'test_helper'

module FFmpeg::FilterGraph
  module Utils
    class HelperTest < UnitTest
      def setup
        @helper = Object.new.tap { |obj| obj.extend(Helper) }
      end

      def test_graph_type
        assert_kind_of Graph, @helper.graph
      end

      def test_chain_type
        assert_kind_of Chain, @helper.chain
      end

      def test_surround_channels_default
        assert_equal %w(FL FR FC LFE RL RR), @helper.surround_channels
      end

      def test_surround_channels_prefix
        assert_equal %w(aaFL aaFR aaFC aaLFE aaRL aaRR),
          @helper.surround_channels('aa')
      end

      def test_surround_channels_subset
        assert_equal %w(FL FC RL), @helper.surround_channels('', :fl, :fc, :rl)
        assert_equal %w(aFL aRL), @helper.surround_channels('a', 'FL', 'rL')
      end

      def test_count_channels
        assert_equal 123, @helper.count_channels(123)
        assert_equal 8, @helper.count_channels('7.1')
        assert_equal 7, @helper.count_channels('6.1')
        assert_equal 6, @helper.count_channels('5.1')
        assert_equal 5, @helper.count_channels('4.1')
        assert_equal 4, @helper.count_channels('3.1')
        assert_equal 3, @helper.count_channels('2.1')
        assert_equal 2, @helper.count_channels('stereo')
        assert_equal 1, @helper.count_channels('mono')

        assert_raises { @helper.count_channels('99.1') }
      end
    end
  end
end
