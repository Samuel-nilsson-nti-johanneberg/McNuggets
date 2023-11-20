require "minitest/test_task"

Minitest::TestTask.create(:test) do
    t.libs << "spec"
    t.libs << "lib"
    t.warning = false
    t.test_globs = ["spec/**/*_spec.rb"]
end

task :default => :test