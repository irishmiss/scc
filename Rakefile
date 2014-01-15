#------------------------------------------------------------------------------
#  Project: Syntactic Code Converter Rake File
#  Author: Jarod Denison
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
#  Libraries
#------------------------------------------------------------------------------

require 'yaml'
#------------------------------------------------------------------------------
#  Pre-Configuration
#------------------------------------------------------------------------------

@time = Time.now
timestamp = Time.new #time stamp
editor = "jd"

#
# Work with config files
#
config = YAML.load_file("_config.yml")
@config = config
#
# Command Line Colorizer
#
def colorize(text, color = "blue")
  case color
    when :blue
      return "\033[34m#{text}\033[0m"
    when :yellow
      return "\033[33m#{text}\033[0m"
    when :green
      return "\033[32m#{text}\033[0m"
    when :red
      return "\033[31m#{text}\033[0m"
    else
      return text
  end
end

puts colorize "[=============== #{config['project']['name']} ===============]", :blue


#------------------------------------------------------------------------------
#  Tasks
#------------------------------------------------------------------------------

#
# Defaults
#
desc "Defaults"
task :default do
  # push Rake::Task[self.config].project.name
  # puts ThemeApp.config.project.name
  Rake::Task["help"].invoke
end

#
# Help
#
desc "Command list"
task :help do

  puts colorize "Syntactic Code Converter Task", :yellow
  puts "  URL: http://irishmiss.com/"
  puts "  Author: Jarod D."
  puts "  Project: #{@config['project']['name']}"

  puts colorize "Available Commands:", :green
  puts "  \"rake clean\" - removing system hidden files"
  puts "  \"rake compile\" - compile files"
end

desc "Generate Static Scripts"
task :compile do
  puts colorize "#{timestamp}: Syntactically code compilation launched", :yellow
  require "./_compile.rb"
  puts colorize "#{timestamp}: Done", :green
  alert "Compilation finished";

end

#
# Remove hidden files
#
desc "Clean up"
task :clean do
  puts colorize "#{timestamp} - Cleaning", :yellow
  puts colorize "#{timestamp} - Removing hidden .DS_Store files", :yellow
  system("find . -name '*.DS_Store' -type f -delete")
  puts colorize "#{timestamp} - Done", :green
end

