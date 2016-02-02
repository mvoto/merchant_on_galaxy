describe MerchantOnGalaxy do
  describe '.run' do
    context 'given a valid argument input file' do
      let(:valid_input_file) { './input_sample.txt' }

      it 'checks output' do
        expect(described_class.run(valid_input_file)).to eq(
          %q(pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about)
        )
      end
    end
  end
end
