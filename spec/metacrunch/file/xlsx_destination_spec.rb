describe Metacrunch::File::XLSXDestination do

  it "creates a XLSX file" do
    destination = Metacrunch::File::XLSXDestination.new(
      Tempfile.new,
      ["Number", "Foo", "Bar"],
      worksheet_title: "A cool title"
    )

    # Write row by row
    (1..100).each do |number|
      row = [number, "Foo #{number}", "Bar #{number}"]
      destination.write(row)
    end

    # Write array of rows
    rows = (1..100).map do |number|
      [number, "Foo #{number}", "Bar #{number}"]
    end
    destination.write(rows)

    destination.close
  end

end
