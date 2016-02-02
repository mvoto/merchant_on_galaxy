describe Oracle do
  describe '.perform' do
    context 'given valid questions with translator' do
      let(:valid_args) do
        {
          intergalactics: ['glob is I'],
          credits: ['glob glob Silver is 10 Credits'],
          questions: ['how much is glob glob ?', 'how many Credits is glob Silver ?']
        }
      end
      let(:translator){ Translator.new(valid_args) }
      subject { described_class.perform(translator) }

      it 'answers questions correclty' do
        expect(subject).to eq(['glob glob is 2', 'glob Silver is 5 Credits'])
      end
    end

    context 'given invalid questions with translator' do
      let(:no_idea_args) do
        {
          intergalactics: ['glob is I'],
          credits: ['glob glob Silver is 10 Credits'],
          questions: ['how much chuca waka ?', 'how many Credits is mogo Loco ?']
        }
      end
      let(:translator){ Translator.new(no_idea_args) }
      let(:expected_no_ideia_message) { "I have no idea what you are talking about" }
      subject { described_class.perform(translator) }

      it 'answers questions saying that did not understand it' do
        expect(subject).to eq([
          expected_no_ideia_message,
          expected_no_ideia_message
        ])
      end
    end
  end
end
