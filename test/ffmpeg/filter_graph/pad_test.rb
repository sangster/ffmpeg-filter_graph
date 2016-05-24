require 'test_helper'

module FFmpeg::FilterGraph
  class PadTest < UnitTest
    def test_in_string
      assert_kind_of Pads::Inpad, Pad.in('1')
      assert_kind_of Pads::Inpad, Pad.in('2:v')
      assert_kind_of Pads::Inpad, Pad.in('4:a:2')
      assert_kind_of Pads::Inpad, Pad.in('tmp')
      assert_kind_of Pads::Inpad, Pad.in('foo_ar')
    end

    def test_in_inpad
      inpad = Pads::Inpad.new('in')

      assert_same inpad, Pad.in(inpad)
    end

    def test_in_outpad
      outpad = Pads::Outpad.new('out')

      assert_kind_of ArgumentError,
        assert_raises { Pad.in(outpad) }
    end

    def test_out_string
      assert_kind_of Pads::Outpad, Pad.out('tmp')
      assert_kind_of Pads::Outpad, Pad.out('foo_ar')
    end

    def test_out_outpad
      outpad = Pads::Outpad.new('out')

      assert_same outpad, Pad.out(outpad)
    end

    def test_out_inpad
      inpad = Pads::Inpad.new('out')

      assert_kind_of ArgumentError,
        assert_raises { Pad.out(inpad) }
    end

    def test_initialize_nil
      assert_kind_of ArgumentError,
        assert_raises { Pad.new(nil) }
    end

    def test_initialize_empty
      assert_kind_of ArgumentError,
        assert_raises { Pad.new('') }
    end

    def test_to_s
      assert_equal '[myname]', Pad.new('myname').to_s
    end
  end
end
