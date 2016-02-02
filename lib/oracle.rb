# Answers all the questions(that are known)
class Oracle

  def self.perform(translator)
    @translator = translator

    answer_questions
  end

  private
  class << self
    attr_reader :translator
  end

  def self.answer_questions
    answers = translator.questions.map do |question|
      credit_question?(question) ? answer_credit(question) : answer_roman(question)
    end

    answers
  end

  def self.credit_question?(question)
    question.include?('Credits')
  end

  def self.answer_credit(question)
    full_sentence  = question[/(?<=how\smany\sCredits\sis\s)(.*)(?=\s\?)/]
    return weird_question_message if full_sentence.nil? || !full_sentence.match(/[A-Z][a-z]+/)
    mineral        = full_sentence[/[A-Z][a-z]+/]
    intergalactics = full_sentence[/.*(?=\s[A-Z][a-z]+)/]

    roman = intergalactics.split(' ').map { |interg| @translator.intergalactic_hash[interg.to_sym] }.join
    return weird_question_message if roman.empty?
    answer_value = NumeralConverter.roman_to_arabic(roman) * @translator.mineral_hash[mineral.to_sym]

    "#{full_sentence} is #{sprintf("%g", answer_value)} Credits"
  end

  def self.answer_roman(question)
    intergalactics = question[/(?<=how\smuch\sis\s)(.*)(?=\s\?)/]
    return weird_question_message if intergalactics.nil?

    roman = intergalactics.split(' ').map do |interg|
      roman_value = @translator.intergalactic_hash[interg.to_sym]
      return weird_question_message if roman_value.nil?
      roman_value
    end.join

    answer_value = NumeralConverter.roman_to_arabic(roman)
    "#{intergalactics} is #{sprintf("%g", answer_value)}"
  end

  def self.weird_question_message
    "I have no idea what you are talking about"
  end
end
