module FFmpeg
  module FilterGraph
  end
end

require 'ffmpeg/filter_graph/utils/strings'

require 'ffmpeg/filter_graph/helper'

require 'ffmpeg/filter_graph/filter'
require 'ffmpeg/filter_graph/filter_factory'
require 'ffmpeg/filter_graph/chain'
require 'ffmpeg/filter_graph/graph'

require 'ffmpeg/filter_graph/pad'
require 'ffmpeg/filter_graph/pads/inpad'
require 'ffmpeg/filter_graph/pads/input'
require 'ffmpeg/filter_graph/pads/outpad'

# These files are responsible for creating the Filter sub-classes
require 'ffmpeg/filter_graph/generators/audio'
require 'ffmpeg/filter_graph/generators/audio_sink'
require 'ffmpeg/filter_graph/generators/audio_src'
require 'ffmpeg/filter_graph/generators/multimedia'
require 'ffmpeg/filter_graph/generators/multimedia_src'
require 'ffmpeg/filter_graph/generators/video'
require 'ffmpeg/filter_graph/generators/video_sink'
require 'ffmpeg/filter_graph/generators/video_src'

require 'ffmpeg/filter_graph/version'
