require "pry" if !ENV["CI"]
require "simplecov"
require "metacrunch/file"

SimpleCov.start

RSpec.configure do |config|
end

def asset_dir
  File.expand_path(File.join(File.dirname(__FILE__), "assets"))
end
