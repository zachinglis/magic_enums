require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('magic_enums', '0.1.0') do |p|
  p.description = "A nice way to have enums in Rails."
  p.url = "http://github.com/zachinglis/magic_enums/tree/master"
  p.author = "Zach Inglis"
  p.email = "zach@lt3media.com"
  p.ignore_pattern = ["tmp/*","script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
