describe FileReader do
  describe '.perform' do
    context 'given a valid input file' do
      let(:valid_input_file) { './input_sample.txt' }
      let(:galaxy_units) do
        [
          "glob is I",
          "prok is V",
          "pish is X",
          "tegj is L",
        ]
      end
      let(:credits) do
        [
          "glob glob Silver is 34 Credits",
          "glob prok Gold is 57800 Credits",
          "pish pish Iron is 3910 Credits"
        ]
      end
      let(:questions) do
        [
          "how much is pish tegj glob glob ?",
          "how many Credits is glob prok Silver ?",
          "how many Credits is glob prok Gold ?",
          "how many Credits is glob prok Iron ?",
          "how much wood could a wood chuck chuck if a wood chuck could chuck wood ?"
        ]
      end
      let(:expected_content) do
        { galaxy_units: galaxy_units, credits: credits, questions: questions }
      end
      subject { described_class.perform(valid_input_file) }

      it 'defines galaxy_units, credits and questions from file content' do
        expect(subject).to eq(expected_content)
      end
    end

    context 'given a non existing input file' do
      let(:invalid_input_file) { './ghost_file.txt' }

      it 'raises Invalid Input Error' do
        expect{ described_class.perform(invalid_input_file) }.to raise_error(
          InvalidInputError
        )
      end
    end
  end

  context 'given an input file without galaxy units' do
    let(:no_galaxy_units_input) { './spec/support/no_galaxy_units_input.txt' }

    it 'raises Invalid Content Error' do
      expect { described_class.perform(no_galaxy_units_input) }.to raise_error(
        InvalidContentError
      )
    end
  end

  context 'given an input file without credits' do
    let(:no_credits_input) { './spec/support/no_credits_input.txt' }

    it 'raises Invalid Content Error' do
      expect { described_class.perform(no_credits_input) }.to raise_error(
        InvalidContentError
      )
    end
  end

  context 'given an input file without questions' do
    let(:no_questions_input) { './spec/support/no_questions_input.txt' }

    it 'raises Invalid Content Error' do
      expect { described_class.perform(no_questions_input) }.to raise_error(
        InvalidContentError
      )
    end
  end
end
