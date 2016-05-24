require 'test_helper'

module FFmpeg::FilterGraph
  class ChainTest < UnitTest
    def test_empty
      chain = Chain.new

      assert_kind_of Array, chain.inputs
      assert_kind_of Array, chain.outputs
      assert_kind_of Array, chain.filters

      assert_empty chain.inputs
      assert_empty chain.outputs
      assert_empty chain.filters

      assert_empty chain.to_s
    end

    def test_inputs
      chain = Chain.new(inputs: %w(a b c))

      assert_equal 3, chain.inputs.size
      chain.inputs.each { |input| assert_kind_of Pads::Inpad, input }
    end

    def test_single_input
      input = Pads::Inpad.new('test')
      chain = Chain.new(inputs: input)

      assert_same input, chain.inputs.first
    end

    def test_outputs
      chain = Chain.new(outputs: %w(a b c))

      assert_equal 3, chain.outputs.size
      chain.outputs.each { |output| assert_kind_of Pads::Outpad, output }
    end

    def test_single_output
      output = Pads::Outpad.new('test')
      chain = Chain.new(outputs: output)

      assert_same output, chain.outputs.first
    end

    def test_filters
      filter_1 = Color.new
      filter_2 = Color.new
      chain = Chain.new(filters: [filter_1, [filter_2], nil])

      assert_equal 2, chain.filters.size
      assert_same filter_1, chain.filters[0]
      assert_same filter_2, chain.filters[1]
    end

    def test_single_filter
      filter = Color.new
      chain = Chain.new(filters: filter)

      assert_same filter, chain.filters.first
    end

    def test_to_s
      assert_equal '[a] color [b]',
        chain = Chain.new(inputs: 'a', outputs: 'b', filters: Color.new).to_s
    end
  end
end
