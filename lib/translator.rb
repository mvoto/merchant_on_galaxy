# This class receives questions and rules and:
#   CREATES A DICTIONARY AND
#   ANSWERS THE QUESTIONS
class Translator

  ROMAN_TO_ARABIC = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

  def initialize(args = {})
    @rules     = args[:rules]
    @questions = args[:questions]

    create_dictionary
  end

  def answer_questions
    # TODO
    []
  end

  private
  attr_reader :rules, :questions

  def create_dictionary
    hsh = { }
    rules.map do |rule|
      hsh.merge!(mount_value_hash(rule)) if value_sentence?
      hsh.merge!(mount_materials_hash(rule)) if value_sentence?
    end

    def value_sentence?
      !!rule.match(/\w+\sis\s\w/)
    end

    def mount_value_hash(rule)
      rule_array = rule.split(' ')
      { rule_array.first.to_sym => ROMAN_TO_ARABIC[rule_array.last.to_sym] }
    end

    def mount_materials_hash(rule)
      # gets the material word from rule sentence
      material = rule[/\w*(?=\sis\s\d\w\sCredits)/].to_sym
    end

    # Os materiais servem para multiplicar os valores obtidos...
  end
end
