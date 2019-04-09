require "metacrunch/file"
require "smarter_csv"

module Metacrunch
  class File::CSVSource

    DEFAULT_OPTIONS = {
      headers: true,
      col_sep: ",",
      row_sep: "\n",
      quote_char: '"',
      file_encoding: "utf-8"
    }

    def initialize(csv_filename, options = {})
      @filename = csv_filename
      @options = DEFAULT_OPTIONS.merge(options)
    end

    def each(&block)
      return enum_for(__method__) unless block_given?

      SmarterCSV.process(@filename, {
        headers_in_file: @options[:headers],
        col_sep: @options[:col_sep],
        row_sep: @options[:row_sep],
        quote_char: @options[:quote_char],
        file_encoding: @options[:file_encoding]
      }) do |line|
        yield line
      end
    end

  end
end
