describe MerchantOnGalaxy do
  describe '.run' do
    context 'given a valid argument input file' do
      let(:valid_input_file) { './input_sample.txt' }
      let(:mocked_rules) do
        [
          "glob is I",
          "prok is V",
          "pish is X",
          "tegj is L",
          "glob glob Silver is 34 Credits",
          "glob prok Gold is 57800 Credits",
          "pish pish Iron is 3910 Credits"
        ]
      end
      let(:mocked_questions) do
        [
          "how much is pish tegj glob glob ?",
          "how many Credits is glob prok Silver ?",
          "how many Credits is glob prok Gold ?",
          "how many Credits is glob prok Iron?",
          "how much wood could a wood chuck chuck if a wood chuck could chuck wood ?"
        ]
      end
      let(:mocked_content) { { rules: mocked_rules, questions: mocked_questions } }
      let(:mocked_translator) { double('Translator') }

      before do
        allow(FileReader).to receive(:perform).with(valid_input_file).and_return(
          mocked_content
        )
        allow(Translator).to receive(:new).with(mocked_content).and_return(
          mocked_translator
        )
      end
      it 'checks entire flow' do
        expect(mocked_translator).to receive(:answer_questions)
        described_class.run(valid_input_file)
      end

      xit 'checks output' do
        # expect(subject).to eq(
        #   "pish tegj glob is 42
        #   glob prok Silver is 68 Credits
        #   glob prok Gold is 57800 Credits
        #   glob prok Iron is 782 Credits
        #   I have no idea what you are talking about"
        # )
      end
    end

    context 'given something going wrong' do
      # TODO
    end
  end
end
