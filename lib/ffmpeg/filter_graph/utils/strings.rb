module FFmpeg::FilterGraph
  module Utils
    module Strings
      # From github: activesupport/lib/active_support/inflector/methods.rb
      def underscore(camel_cased_word)
        return camel_cased_word unless camel_cased_word =~ /[A-Z-]/
        word = camel_cased_word.dup
        word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        word.tr!('-', '_')
        word.downcase!
        word
      end
    end
  end
end
