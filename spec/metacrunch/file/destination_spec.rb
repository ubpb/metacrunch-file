describe Metacrunch::File::Destination do

  context "when data is an Array" do
    it "writes to a file" do
      tempfile = Tempfile.new

      begin
        data = (1..100).map { |number| "Number #{number}\n" }

        destination = Metacrunch::File::Destination.new(tempfile, override_existing_file: true)
        destination.write(data)
        destination.close

        expect(File.read(tempfile)).to eq(data.join)
      ensure
        File.delete(tempfile)
      end
    end
  end

  context "when data is not an Array" do
    it "writes to a file" do
      tempfile = Tempfile.new

      begin
        data = (1..100).map { |number| "Number #{number}\n" }.join

        destination = Metacrunch::File::Destination.new(tempfile, override_existing_file: true)
        destination.write(data)
        destination.close

        expect(File.read(tempfile)).to eq(data)
      ensure
        File.delete(tempfile)
      end
    end
  end

  context "when file exists but overriding option is set to false" do
    it "throws a error" do
      tempfile = Tempfile.new

      begin
        expect{
          Metacrunch::File::Destination.new(tempfile, override_existing_file: false)
        }.to raise_error(RuntimeError)
      ensure
        File.delete(tempfile)
      end
    end
  end

end
