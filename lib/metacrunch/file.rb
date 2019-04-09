require "active_support"
require "active_support/core_ext"

module Metacrunch
  module File
    require_relative "file/entry"
    require_relative "file/file_source"
    require_relative "file/source"
    require_relative "file/destination"
    require_relative "file/xlsx_destination"
  end
end
