# vim: ft=ruby:

guard 'minitest',
    all_on_start: false,
    all_after_pass: false,
    env: {'SKIP_COVERAGE' => 1},
    notification: true do

  watch('Gemfile.lock')
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
end
