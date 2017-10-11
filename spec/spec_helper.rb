require "pry" if !ENV["CI"]

require "simplecov"
SimpleCov.start do
  add_filter %r{^/spec/}
end

require "metacrunch/file"

RSpec.configure do |config|
end

def asset_dir
  File.expand_path(File.join(File.dirname(__FILE__), "assets"))
end
