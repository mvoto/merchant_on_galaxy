describe Translator do
  describe '.dictionary' do
    context 'given galaxy units, credits and questions' do
      let(:valid_args) do
        {
          galaxy_units: ['glob is I', 'prok is V'],
          credits: ['glob glob Silver is 8 Credits', 'glob prok Gold is 40 Credits'],
          questions: ['How many Credits is glob prok Silver ?']
        }
      end
      subject { described_class.new(valid_args).dictionary }

      it 'defines galaxy units hash' do
        expect(subject[:galaxy_unit]).to eq({ glob: 'I', prok: 'V' })
      end

      it 'defines minerals hash' do
        expect(subject[:mineral]).to eq({ :Silver => 4, :Gold => 10 })
      end
    end
  end
end
