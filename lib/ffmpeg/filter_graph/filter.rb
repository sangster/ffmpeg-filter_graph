module FFmpeg::FilterGraph
  class Filter
    class << self
      # @param name [String] Sets the filter-name output by this filter
      def name(name = nil)
        if name.nil?
          @name || fail('filter name not set')
        else
          @name = name
        end
      end

      # @param opts [Array<String>] a list of valid options for this filter
      def option(*opts)
        @opts ||= []

        if opts.any?
          @opts.concat(opts)
          attr_accessor *opts
        end

        @opts
      end
      alias_method :options, :option
    end

    def to_s
      if options.any?
        "#{self.class.name}=#{options_string}"
      else
        self.class.name
      end
    end

    # @return [String] A string concatenating the set options.
    # @note May be overridden by atypical filters
    def options_string
      join_options(*options.keys)
    end

    # Set all options to nil
    def empty!
      self.class.options.each { |opt| send("#{opt}=", nil) }
    end

    # @return [Hash<String,String>] a map of all options and their values. nil
    # values will not be included.
    def options
      ret = {}
      self.class.options.each do |opt|
        if (val = self.send(opt))
          ret[opt] = val
        end
      end
      ret
    end

    protected

    # @param keys [Array<Symbol>] the names of the options to join together
    # @return [String, nil] a string concatenating all options, in the format of
    # "k1=v1:k2=v2:k3=v3". Will return nil of there are no set values
    def join_options(*keys)
      opts = options
      parts = keys.map { |k| "#{k}=#{opts[k]}" if opts[k] }.compact
      parts.join(':') if parts.any?
    end
  end
end
