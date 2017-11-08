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
    end

    def write(data)
      return if data.blank?

      if data.is_a?(Array)
        ::File.open(@filename, 'ab+') do |file|
          data.each { |row| file.write(row) }
        end
      else
        ::File.open(@filename, 'ab+') { |file| file.write(data) }
      end
    end

    def close
      # noop
    end

  end
end
