# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffmpeg/filter_graph/version'

Gem::Specification.new do |spec|
  spec.name          = 'ffmpeg-filter_graph'
  spec.version       = Ffmpeg::FilterGraph::VERSION
  spec.authors       = ['Jon Sangster']
  spec.email         = ['jon@ertt.ca']

  spec.summary       = %q{FFmpeg filter-graph generator}
  spec.description   = %q{This gem generates complex filter-graph's for use with the ffmpeg application. ie: Values for the -filter_complex command-line option.}
  spec.homepage      = 'https://github.com/sangster/ffmpeg-filter_graph'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1.8'

  spec.add_development_dependency 'guard', '~> 2.13.0'
  spec.add_development_dependency 'guard-minitest', '~> 2.4.4'

  spec.add_development_dependency 'yard', '~> 0.7'
  spec.add_development_dependency 'rdoc', '~> 3.12'
end
