require "metacrunch/file"
require "axlsx"

module Metacrunch
  class File::XLSXDestination

    DEFAULT_OPTIONS = {
      worksheet_title: "My data"
    }

    def initialize(filename, columns, options = {})
      @filename = filename
      @columns = columns
      @options = DEFAULT_OPTIONS.deep_merge(options)

      @package = Axlsx::Package.new
      @workbook = @package.workbook
      @sheet = @workbook.add_worksheet(name: @options[:worksheet_title])

      @sheet.add_row(columns, types: :string)
    end

    def write(row)
      return if row.blank?
      @sheet.add_row(row, types: :string)
    end

    def close
      # Make the first row a header
      @sheet.sheet_view.pane do |pane|
        pane.top_left_cell = "A2"
        pane.state = :frozen_split
        pane.y_split = 1
        pane.x_split = 0
        pane.active_pane = :bottom_right
      end

      # Add a filter
      @sheet.auto_filter = @sheet.dimension.sqref

      # Generate file
      @package.serialize(@filename)
    end

  end
end
