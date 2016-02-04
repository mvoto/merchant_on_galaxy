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
    questions.map { |question| decide_answer(question) }
  end

  def self.decide_answer(question)
    info = initialize_question_info(question)
    credit?(question) ? credit_answer(question, info) : roman_answer(question, info)
  end

  def self.credit?(sentence)
    sentence.include?('Credits')
  end

  def self.credit_answer(sentence, question_info)
    return weird_question_message if nil_or_empty_info?(question_info.full_sentence)

    roman = extract_roman(question_info.galaxy_units)
    return weird_question_message if nil_or_empty_info?(roman)
    answer_value = calculate_credit_answer(roman, question_info.mineral)

    "#{question_info.full_sentence} is #{sprintf("%g", answer_value)} Credits"
  end

  def self.roman_answer(sentence, question_info)
    return weird_question_message if nil_or_empty_info?(question_info.roman_galaxy_units)
    roman = extract_roman(question_info.roman_galaxy_units)
    return weird_question_message if nil_or_empty_info?(roman)

    answer_value = NumeralConverter.roman_to_arabic(roman)

    "#{question_info.roman_galaxy_units} is #{sprintf("%g", answer_value)}"
  end

  def self.extract_roman(galaxy_units)
    galaxy_units.split(' ').collect do |unit|
      dictionary[:galaxy_unit][unit.to_sym]
    end.join
  end

  def self.calculate_credit_answer(roman, mineral)
    mineral_value = dictionary[:mineral][mineral.to_sym]
    roman_value   = NumeralConverter.roman_to_arabic(roman)

    roman_value * mineral_value
  end

  def self.weird_question_message
    "I have no idea what you are talking about"
  end

  def self.initialize_question_info(sentence)
    QuestionInfo.new(sentence)
  end

  def self.nil_or_empty_info?(info)
    info.nil? || info.empty?
  end
end
