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
  attr_reader :rules, :questions, :intergalactic_values_hash

  def create_dictionary
    values_hash = {}
    rules.map{ |rule| values_hash.merge!(mount_value_hash(rule)) if value_sentence? }
    @values_hash = intergalactic_values_hash
    # rules.map{ |rule| calculate_materials }

    def value_sentence?
      !!rule.match(/\w+\sis\s\w/)
    end

    def values_hash(rule)
      rule_array = rule.split(' ')
      { rule_array.first.to_sym => ROMAN_TO_ARABIC[rule_array.last.to_sym] }
    end

    def calculate_materials(rule)
      # gets the material word from rule sentence(word before is X Credits)
      material = rule[/\w*(?=\sis\s\d\w\sCredits)/].to_sym
      # gets the credit value digit from rule sentence(digit before Credits)
      credit_value = rule[/\d*(?=\sCredits)/].to_sym
      # gets the unkown values words from rule sentence(everything before #{material})
      intergalactic_value = rule[/.*(?=\s#{material})/]

      arabic_value = mount_roman(intergalactic_value)
      # Materials values are like multipliers *
    end

    def mount_roman(intergalactic_value)
      intergalactic_value.split(' ').map { |value| intergalactic_values_hash[value] }
    end
  end
end
