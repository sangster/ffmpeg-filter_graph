module FFmpeg::FilterGraph::Utils
  module Strings
    # From github: activesupport/lib/active_support/inflector/methods.rb
    def underscore(camel_cased_word)
      return camel_cased_word unless camel_cased_word =~ /[A-Z-]|::/
      word = camel_cased_word.to_s.gsub(/::/, '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end

    def camel_case_to_snake_case(str)
      [
        str[0]&.downcase,
        str[1..-1].gsub(/[A-Z]/) { |s| "-#{s.downcase}" }
      ].join
    end
  end
end
