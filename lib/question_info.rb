class QuestionInfo
  attr_reader :full_sentence, :mineral, :galaxy_units, :roman_galaxy_units

  def initialize(question_sentence)
    @full_sentence = question_sentence[/(?<=how\smany\sCredits\sis\s)(.*)(?=\s\?)/]
    @mineral       = full_sentence ? full_sentence[/[A-Z][a-z]+/] : nil
    @galaxy_units  = full_sentence ? full_sentence[/.*(?=\s[A-Z][a-z]+)/] : nil
    @roman_galaxy_units = question_sentence[/(?<=how\smuch\sis\s)(.*)(?=\s\?)/]
  end
end
