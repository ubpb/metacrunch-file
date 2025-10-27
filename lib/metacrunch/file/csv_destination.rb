require "metacrunch/file"
require "smarter_csv"

module Metacrunch
  class File::CSVDestination

    DEFAULT_OPTIONS = {
      override_existing_file: false,
      csv_options: {}
    }

    def initialize(filename, options = {})
      @filename = ::File.expand_path(filename)
      @options  = DEFAULT_OPTIONS.deep_merge(options)

      if ::File.exist?(@filename) && @options[:override_existing_file] == false
        raise "File `#{@filename}` exists but `override_existing_file` option was set to `false`"
      end

      @csv_writer = SmarterCSV::Writer.new(@filename, @options[:csv_options])
    end

    def write(data)
      @csv_writer << data
    end

    def close
      @csv_writer.finalize if @csv_writer
    end

  end
end
