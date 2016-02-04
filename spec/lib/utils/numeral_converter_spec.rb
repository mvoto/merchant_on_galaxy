describe NumeralConverter do
  describe '.roman_to_arabic' do
    it 'converts IV to arabic' do
      expect(described_class.roman_to_arabic('IV')).to eq(4)
    end

    it 'converts DIV to arabic' do
      expect(described_class.roman_to_arabic('DIV')).to eq(504)
    end

    it 'converts MMXVI to arabic' do
      expect(described_class.roman_to_arabic('MMXVI')).to eq(2016)
    end
  end
end
