require "metacrunch/file"

module Metacrunch
  class File::Destination < File::FileDestination

    def initialize(filename, options = {})
      warn "[DEPRECATION] `Metacrunch::File::Destination` is deprecated.  Please use `Metacrunch::File::FileDestination` instead."
      super
    end

  end
end
