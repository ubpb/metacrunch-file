describe Metacrunch::File::CSVDestination do

  it "creates a CSV file" do
    destination = Metacrunch::File::CSVDestination.new(
      Tempfile.new,
      ["Col 1", "Col 2", "Col 3"],
      override_existing_file: true,
      csv_options: {
        col_sep: ";"
      }
    )

    # Write row by row
    (1..100).each do |number|
      row = [number, "Foo #{number}", "Bar ; #{number}"]
      destination.write(row)
    end

    # Write array of rows
    rows = (1..100).map do |number|
      [number, "Foo #{number}", "Bar ; #{number}"]
    end
    destination.write(rows)

    destination.close
  end

end

