require "metacrunch/file"

module Metacrunch
  class File::CSVDestination

    DEFAULT_OPTIONS = {
      override_existing_file: false,
      csv_options: {}
    }

    def initialize(filename, headers, options = {})
      @filename = ::File.expand_path(filename)
      @headers  = headers
      @options  = DEFAULT_OPTIONS.deep_merge(options)

      if ::File.exists?(@filename) && @options[:override_existing_file] == false
        raise "File `#{@filename}` exists but `override_existing_file` option was set to `false`"
      end

      @file = ::File.open(@filename, 'wb+')

      if @headers.present?
        raise ArgumentError, "Headers must be an Array" unless @headers.is_a?(Array)
        csv_str = CSV.generate_line(@headers, **@options[:csv_options])
        @file.write(csv_str)
      end
    end

    def write(data)
      return if data.blank?
      raise ArgumentError, "Data must be an Array" unless data.is_a?(Array)

      if data.first.is_a?(Array)
        data.each do |d|
          csv_str = CSV.generate_line(d, **@options[:csv_options])
          @file.write(csv_str)
        end
      else
        csv_str = CSV.generate_line(data, **@options[:csv_options])
        @file.write(csv_str)
      end
    end

    def close
      @file.close if @file
    end

  end
end
