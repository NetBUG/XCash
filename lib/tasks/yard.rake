begin
  require 'yard'
  require 'yard/rake/yardoc_task'

  namespace :doc do
    YARD::Rake::YardocTask.new(:yard)

    task default: :yard
  end

  task doc: 'doc:default'
rescue LoadError
  namespace :doc do
    task :yard do
      raise "You have bundled application without doc dependencies\nRun:\n\nrm .bundle/config && bundle"
    end
    task default: :yard
  end
end
