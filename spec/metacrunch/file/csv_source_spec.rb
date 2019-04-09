describe Metacrunch::File::CSVSource do

  describe "#each" do
    subject { Metacrunch::File::CSVSource.new(File.join(asset_dir, "pets.csv")) }

    context "when called without a block" do
      it "returns an enumerator" do
        expect(subject.each).to be_a(Enumerator)
      end
    end

    context "when called with a block" do
      it "calls the block for each line in the csv file" do
        lines = []
        subject.each do |line|
          lines << line
        end

        expect(lines.count).to be(4)
      end
    end
  end

end
