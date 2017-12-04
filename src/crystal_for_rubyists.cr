require "kemal"
require "kemal-watcher"

get "/" do
  java_processes = `ps ax | grep java`
  lines_found = java_processes.split('\n').size
  java_processes = java_processes.split('\n')[0, (lines_found-3)].join('\n') if lines_found > 3

  render "src/views/main.ecr"
end

files = [
  "src/views/*.ecr",
  "src/crystal_for_rubyists.cr"
]


Kemal.watch(files)
Kemal.run
