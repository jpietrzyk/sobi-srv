# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

if %w(development test).include? Rails.env
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir.glob('spec/**/*_spec.rb')
    t.fail_on_error = true
    # t.rspec_opts = '--format documentation'
    # t.rspec_opts << ' more options'
    # t.rcov = true
  end

  # RuboCop::RakeTask.new
end

task(:default).clear
task default: [:rubocop, :spec]
task default: [:spec]

Rails.application.load_tasks
