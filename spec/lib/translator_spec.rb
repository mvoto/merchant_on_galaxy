describe Translator do
  describe '.new' do
    context 'given intergalactics, credits and questions' do
      let(:valid_args) do
        {
          intergalactics: ['glob is I', 'prok is V'],
          credits: ['glob glob Silver is 8 Credits', 'glob prok Gold is 40 Credits'],
          questions: ['How many Credits is glob prok Silver ?']
        }
      end
      subject { described_class.new(valid_args) }

      it 'defines intergalactics hash' do
        expect(subject.intergalactic_hash).to eq({ glob: 'I', prok: 'V' })
      end

      it 'defines minerals hash' do
        expect(subject.mineral_hash).to eq({ :Silver => 4, :Gold => 10 })
      end
    end

    context 'given no intergalactics args' do
      let(:no_rules_args) do
        { intergalactics: [], credits: ['a', 'credit'], questions: ['this', 'question'] }
      end

      it 'raises Missing Rules Error' do
        expect{ described_class.new(no_rules_args) }.to raise_error(MissingRulesError)
      end
    end

    context 'given no credits args' do
      let(:no_rules_args) do
        { intergalactics: ['a', 'interg'], credits: [], questions: ['this', 'question'] }
      end

      it 'raises Missing Rules Error' do
        expect{ described_class.new(no_rules_args) }.to raise_error(MissingRulesError)
      end
    end

    context 'given no questions args' do
      let(:no_questions_args) do
        {
          intergalactics: ['glob is I'],
          credits: ['glob glob Silver is 10 Credits'],
          questions: []
        }
      end

      it 'raises Missing Questions Error' do
        expect{ described_class.new(no_questions_args) }.to raise_error(
          MissingQuestionsError
        )
      end
    end
  end
end
