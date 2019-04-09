require "metacrunch/file"

module Metacrunch
  class File::Source < File::FileSource

    def initialize(filenames)
      warn "[DEPRECATION] `Metacrunch::File::Source` is deprecated.  Please use `Metacrunch::File::FileSource` instead."
      super
    end

  end
end
