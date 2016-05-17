module FFmpeg::FilterGraph
  # This factory creates a new [Filter] subclass. The filters are all very
  # silimar, so it's easier to generate each class than to write them by hand.
  class FilterFactory
    include Utils::Strings

    attr_accessor :class_name, :required, :optional, :options_string

    # @param class_name [#to_s] the name of the class to create
    # @param required [nil, Array<String>] an optional list of the filter
    #   options which must be passed to its constructor
    # @param optional [nil, Array<String>] an optional list of the filter
    #   options which are not required by the filter
    # @param options_string [Block] An optional callback to override the
    #   default method of constructing the string of options in the filter's
    #   output.
    # @see Filter#options_string
    def initialize(class_name, required, optional, &options_string)
      self.class_name = class_name.to_s
      self.required = required || []
      self.optional = optional || []
      self.options_string = options_string
    end

    # @param mod [Module] the module to create the new class in
    # @param helper_module [Module] an optional module to create a helper-method
    # in. ex: if the filter class is named MyFilter, a method will be created
    # in the form of Helper.my_filter(*args); MyFilter.new(*args) end
    def create_class_in(mod, helper_module: Helper)
      # We need to make these local vars, to work in the Class.new block
      cn = class_name.to_s
      req = required
      opt = optional
      opt_str = options_string

      mod.const_set(
        cn,
        Class.new(Filter) do
          const_set('REQUIRED', req.freeze)
          const_set('OPTIONAL', opt.freeze)

          name(cn.downcase.to_sym)
          options(*(const_get('REQUIRED') + const_get('OPTIONAL')))

          def initialize(args = {})
            self.class.const_get('REQUIRED').each do |o|
              fail ArgumentError, "missing keyword: #{o}" unless args.key?(o)
            end
            args.each { |k, v| send("#{k}=", v) }
          end

          define_method(:options_string, &opt_str) if opt_str
        end
      )

      if helper_module
        helper_name = underscore(cn)

        helper_module.module_exec do
          klass = mod.const_get(cn)
          define_method(helper_name) { |*args| klass.new(*args) }
        end
      end
    end
  end
end
