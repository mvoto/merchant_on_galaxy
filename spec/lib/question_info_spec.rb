describe QuestionInfo do
  describe '.new' do
    context 'given a credits question' do
      let(:sentence) { 'how many Credits is glob prok Silver ?' }
      subject { described_class.new(sentence) }

      it 'extracts full sentence' do
        expect(subject.full_sentence).to eq('glob prok Silver')
      end

      it 'extracts mineral' do
        expect(subject.mineral).to eq('Silver')
      end

      it 'extracts galaxy units' do
        expect(subject.galaxy_units).to eq('glob prok')
      end
    end

    context 'given a galactic to roman question' do
      let(:sentence) { 'how much is pish tegj glob glob ?' }
      subject { described_class.new(sentence) }

      it 'extracts roman galaxy units' do
        expect(subject.roman_galaxy_units).to eq('pish tegj glob glob')
      end
    end
  end
end
