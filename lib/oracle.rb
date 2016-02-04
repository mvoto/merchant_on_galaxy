# Answers all the questions(that are known)
class Oracle

  def self.perform(translator)
    @dictionary = translator.dictionary

    answer_questions(translator.questions)
  end

  private
  class << self
    attr_reader :dictionary
  end

  def self.answer_questions(questions)
    questions.map { |question| answer(question) }
  end

  def self.answer(question)
    info = initialize_question_info(question)
    credit?(question) ? credit_answer(question, info) : roman_answer(question, info)
  end

  def self.credit?(sentence)
    sentence.include?('Credits')
  end

  def self.credit_answer(sentence, question_info)
    mineral       = question_info.mineral
    galaxy_units  = question_info.galaxy_units
    return weird_question_message if question_info.full_sentence.nil? || !question_info.full_sentence.match(/[A-Z][a-z]+/)

    roman = galaxy_units.split(' ').map { |interg| dictionary[:galaxy_unit][interg.to_sym] }.join
    return weird_question_message if roman.empty?
    answer_value = NumeralConverter.roman_to_arabic(roman) * dictionary[:mineral][mineral.to_sym]

    "#{question_info.full_sentence} is #{sprintf("%g", answer_value)} Credits"
  end

  def self.roman_answer(sentence, question_info)
    return weird_question_message if question_info.roman_galaxy_units.nil?

    # TODO: maybe a method would help here ?
    roman = question_info.roman_galaxy_units.split(' ').collect do |interg|
      roman_value = dictionary[:galaxy_unit][interg.to_sym]
      return weird_question_message if roman_value.nil?
      roman_value
    end.join

    answer_value = NumeralConverter.roman_to_arabic(roman)
    "#{question_info.roman_galaxy_units} is #{sprintf("%g", answer_value)}"
  end

  def self.weird_question_message
    "I have no idea what you are talking about"
  end

  def self.initialize_question_info(sentence)
    QuestionInfo.new(sentence)
  end
end
