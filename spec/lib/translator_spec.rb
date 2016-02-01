describe Translator do
  context 'given rules and questions' do
    it 'defines intergalactic from sentence' do

    end

    it 'defines credits sentence' do

    end
  end

  context 'given no rules args' do
    let(:no_rules_args) { { rules: [], questions: ['this', 'question'] } }

    it 'raises Missing Rules Error' do
      expect{ described_class.new(no_rules_args) }.to raise_error(MissingRulesError)
    end
  end

  context 'given no questions args' do
    let(:no_questions_args) { { rules: ['this', 'rule'], questions: [] } }
    it 'raises Missing Questions Error' do
      expect{ described_class.new(no_questions_args) }.to raise_error(
        MissingQuestionsError
      )
    end
  end
end
