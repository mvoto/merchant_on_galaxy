describe CreditInfo do
  describe '.new' do
    let(:credit) { 'glob glob Silver is 34 Credits' }
    subject { described_class.new(credit) }

    it 'extracts until credits word' do
      expect(subject.until_mineral_word).to eq('glob glob')
    end

    it 'extracts value' do
      expect(subject.value).to eq('34')
    end

    it 'extracts mineral' do
      expect(subject.mineral).to eq('Silver')
    end
  end
end
