#!/usr/bin/ruby
require 'yaml'
config = YAML.load_file('_config.yml')
collection = YAML.load_file('_compile.yml')
collection.each {
  |d,param|
  engine = param['compiler']
  behavior = param['params']
  source = config['dir']['work'] + param['source']
  extension = param['extname']['react']
  files = Dir[source+'/*'+extension]
  descend = config['dir']['work'] + param['destination']
  files.each {
    |file|
    if (File.basename(file)[0] != "_")
      basename = '/' + File.basename(file,".*")
      fname_in  = source + file
      fname_out = descend + basename + param['extname']['store']
      system("#{engine} #{file} #{behavior} #{fname_out}")
      puts "[Done]: #{file}	#{fname_out}"
    end
  }
}