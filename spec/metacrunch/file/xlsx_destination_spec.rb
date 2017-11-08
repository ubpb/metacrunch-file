describe Metacrunch::File::XLSXDestination do

  it "creates a XLSX file" do
    destination = Metacrunch::File::XLSXDestination.new(
      "/tmp/metacrunch-xlsx-test.xlsx",
      ["Number", "Foo", "Bar"],
      worksheet_title: "A cool title"
    )

    (1..100).each do |number|
      row = [number, "Foo #{number}", "Bar #{number}"]
      destination.write(row)
    end

    destination.close
  end

end
