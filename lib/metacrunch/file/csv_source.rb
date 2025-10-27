require "metacrunch/file"
require "smarter_csv"

module Metacrunch
  class File::CSVSource

    DEFAULT_OPTIONS = {
      csv_options: {
        headers_in_file: true,
        col_sep: ",",
        row_sep: "\n",
        quote_char: '"',
        file_encoding: "utf-8"
      }
    }

    def initialize(csv_filename, options = {})
      @filename = csv_filename
      @options = DEFAULT_OPTIONS.merge(options)
    end

    def each(&block)
      return enum_for(__method__) unless block_given?

      SmarterCSV.process(@filename, @options[:csv_options]) do |line|
        yield line
      end
    end

  end
end
