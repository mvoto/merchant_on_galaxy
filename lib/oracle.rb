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
    answers = questions.map do |question|
      credit_question?(question) ? answer_credit(question) : answer_roman(question)
    end

    answers
  end

  def self.credit_question?(question)
    question.include?('Credits')
  end

  def self.answer_credit(question)
    # TODO: Create a QuestionInfo class(such as CreditInfo) to refactor all that regex mess
    full_sentence  = question[/(?<=how\smany\sCredits\sis\s)(.*)(?=\s\?)/]
    return weird_question_message if full_sentence.nil? || !full_sentence.match(/[A-Z][a-z]+/)
    mineral        = full_sentence[/[A-Z][a-z]+/]
    galaxy_units = full_sentence[/.*(?=\s[A-Z][a-z]+)/]

    roman = galaxy_units.split(' ').map { |interg| dictionary[:galaxy_unit][interg.to_sym] }.join
    return weird_question_message if roman.empty?
    answer_value = NumeralConverter.roman_to_arabic(roman) * dictionary[:mineral][mineral.to_sym]

    "#{full_sentence} is #{sprintf("%g", answer_value)} Credits"
  end

  def self.answer_roman(question)
    galaxy_units = question[/(?<=how\smuch\sis\s)(.*)(?=\s\?)/]
    return weird_question_message if galaxy_units.nil?

    # TODO: maybe a method would help here ?
    roman = galaxy_units.split(' ').map do |interg|
      roman_value = dictionary[:galaxy_unit][interg.to_sym]
      return weird_question_message if roman_value.nil?
      roman_value
    end.join

    answer_value = NumeralConverter.roman_to_arabic(roman)
    "#{galaxy_units} is #{sprintf("%g", answer_value)}"
  end

  def self.weird_question_message
    "I have no idea what you are talking about"
  end
end
