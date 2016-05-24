require 'test_helper'

module FFmpeg::FilterGraph
  TestMod = Module.new # holds the created Classes
  TestHelper = Module.new # for helper methods

  class FilterFactoryTest < UnitTest
    def test_generated_class
      factory = FilterFactory.new(:MyClass1)
      factory.create_class_in(TestMod, helper_module: nil)

      assert_equal :myclass1, TestMod::MyClass1.name
      refute_nil TestMod::MyClass1
      assert_empty TestMod::MyClass1::REQUIRED
      assert_empty TestMod::MyClass1::OPTIONAL
    end

    def test_required_methods
      factory = FilterFactory.new(:MyClass2, [:foo, :bar])
      factory.create_class_in(TestMod, helper_module: nil)

      assert_equal 2, TestMod::MyClass2::REQUIRED.size
      assert_empty TestMod::MyClass2::OPTIONAL

      assert_raises(ArgumentError) { TestMod::MyClass2.new }
      assert_raises(ArgumentError) { TestMod::MyClass2.new(foo: 1) }
      assert_raises(ArgumentError) { TestMod::MyClass2.new(bar: 2) }

      obj = TestMod::MyClass2.new(foo: 1, bar: 2)

      assert_equal 1, obj.foo
      assert_equal 2, obj.bar

      obj.foo = 11
      obj.bar = 22

      assert_equal 11, obj.foo
      assert_equal 22, obj.bar
    end

    def test_optional_methods
      factory = FilterFactory.new(:MyClass3, nil, [:foo, :bar])
      factory.create_class_in(TestMod, helper_module: nil)

      assert_empty TestMod::MyClass3::REQUIRED
      assert_equal 2, TestMod::MyClass3::OPTIONAL.size

      assert_nil TestMod::MyClass3.new.foo
      assert_nil TestMod::MyClass3.new.bar

      obj = TestMod::MyClass3.new(foo: 1, bar: 2)

      assert_equal 1, obj.foo
      assert_equal 2, obj.bar

      obj.foo = 11
      obj.bar = 22

      assert_equal 11, obj.foo
      assert_equal 22, obj.bar

      obj.empty!

      assert_nil obj.foo
      assert_nil obj.bar
    end

    def test_to_s
      factory = FilterFactory.new(:MyClass4, [:foo], [:bar])
      factory.create_class_in(TestMod, helper_module: nil)

      obj = TestMod::MyClass4.new(foo: 1, bar: 2)

      assert_equal 'myclass4=foo=1:bar=2', obj.to_s
    end

    def test_options_string
      factory = FilterFactory.new(:MyClass5, [:foo]) { 'my_options' }
      factory.create_class_in(TestMod, helper_module: nil)

      assert_equal 'myclass5=my_options', TestMod::MyClass5.new(foo: 1).to_s
    end

    def test_helper_method
      factory = FilterFactory.new(:MyClass6, [:foo])
      factory.create_class_in(TestMod, helper_module: TestHelper)

      obj = Object.new.tap { |o| o.extend(TestHelper) }

      assert_kind_of TestMod::MyClass6, obj.my_class6(foo: 1)
      assert_raises(ArgumentError) { obj.my_class6 }
    end
  end
end
