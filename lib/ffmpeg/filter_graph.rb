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

require 'ffmpeg/filter_graph/generate_filters_audio'
require 'ffmpeg/filter_graph/generate_filters_audio_sink'
require 'ffmpeg/filter_graph/generate_filters_audio_src'
require 'ffmpeg/filter_graph/generate_filters_multimedia'
require 'ffmpeg/filter_graph/generate_filters_multimedia_src'
require 'ffmpeg/filter_graph/generate_filters_video'
require 'ffmpeg/filter_graph/generate_filters_video_sink'
require 'ffmpeg/filter_graph/generate_filters_video_src'

require 'ffmpeg/filter_graph/version'
