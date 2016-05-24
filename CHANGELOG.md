# CHANGELOG

## [Unreleased]

### Added
 - Extracted from `rifftrax` gem.
 - `FFmpeg::FilterGraph::Helper` can be merged into client classes for easy use.
 - Filters can created with `editable` flag, to allow Timeline Editing options.
 - FilterGraph: Option names that start with a digit can be prefixed with an
   underscore: `:_0a` -> `0a`
 - FilterGraph: Option names that include a dash can be specified in camelCase:
   `:softKnee` -> `soft-knee`
 - Moved `Helper` mixin to `FFmpeg::FilterGraph::Utils`
 - Inpads/Outpads are encapsulated in classes, instead of naked strings
