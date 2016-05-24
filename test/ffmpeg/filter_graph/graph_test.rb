require 'test_helper'

module FFmpeg::FilterGraph
  class GraphTest < UnitTest
    def test_empty
      graph = Graph.new

      assert_kind_of Array, graph.outputs
      assert_kind_of Array, graph.chains

      assert_empty graph.outputs
      assert_empty graph.chains

      assert_empty graph.to_s
    end

    def test_outputs
      graph = Graph.new(outputs: %w(a b c))

      assert_equal 3, graph.outputs.size
      graph.outputs.each { |output| assert_kind_of Pads::Outpad, output }
    end

    def test_single_output
      output = Pads::Outpad.new('test')
      graph = Graph.new(outputs: output)

      assert_same output, graph.outputs.first
    end

    def test_to_s
      chain_1 = Chain.new(inputs: 'a', filters: Color.new)
      chain_2 = Chain.new(filters: [Color.new, Copy.new])

      assert_equal '[a] color [b]',
        graph = Graph.new(outputs: 'b', chains: chain_1).to_s

      assert_equal '[a] color; color, copy [b]',
        graph = Graph.new(outputs: 'b', chains: [chain_1, chain_2]).to_s
    end
  end
end
