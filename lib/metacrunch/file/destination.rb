require "metacrunch/file"

module Metacrunch
  class File::Destination

    DEFAULT_OPTIONS = {
      override_existing_file: false
    }

    def initialize(filename, options = {})
      @filename = ::File.expand_path(filename)
      @options = DEFAULT_OPTIONS.deep_merge(options)

      if ::File.exists?(@filename) && @options[:override_existing_file] == false
        raise "File `#{@filename}` exists but `override_existing_file` option was set to `false`"
      end

      @file = ::File.open(@filename, 'wb+')
    end

    def write(data)
      return if data.blank?

      if data.is_a?(Array)
        data.each { |row| @file.write(row) }
      else
        @file.write(data)
      end
    end

    def close
      @file.close if @file
    end

  end
end
