describe Metacrunch::File::CSVDestination do

  it "creates a CSV file" do
    destination = Metacrunch::File::CSVDestination.new(
      Tempfile.new,
      override_existing_file: true,
      csv_options: {
        col_sep: ";"
      }
    )

    # Write row by row
    (1..100).each do |number|
      row = {foo: "Foo #{number}"}
      destination.write(row)
    end

    # Write array of rows
    rows = (1..100).map do |number|
      {foo: "Foo #{number}"}
    end
    destination.write(rows)

    destination.close
  end

end

