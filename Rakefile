require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Start "guard" test runner'
task :guard do
  sh 'bundle exec guard'
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
