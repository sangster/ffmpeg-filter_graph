require 'simplecov'
SimpleCov.start { add_filter '/test/' } unless ENV.key?('SKIP_COVERAGE')

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'byebug'
require 'ffmpeg/filter_graph'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class UnitTest < Minitest::Test
end
