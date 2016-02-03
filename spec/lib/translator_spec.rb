describe Translator do
  describe '.dictionary' do
    context 'given intergalactics, credits and questions' do
      let(:valid_args) do
        {
          intergalactics: ['glob is I', 'prok is V'],
          credits: ['glob glob Silver is 8 Credits', 'glob prok Gold is 40 Credits'],
          questions: ['How many Credits is glob prok Silver ?']
        }
      end
      subject { described_class.new(valid_args).dictionary }

      it 'defines intergalactics hash' do
        expect(subject[:intergalactic]).to eq({ glob: 'I', prok: 'V' })
      end

      it 'defines minerals hash' do
        expect(subject[:mineral]).to eq({ :Silver => 4, :Gold => 10 })
      end
    end
  end
end
