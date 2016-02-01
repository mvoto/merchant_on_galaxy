# This class receives questions and rules and:
#   CREATES A DICTIONARY AND
#   ANSWERS THE QUESTIONS
class Translator

  # TODO: refactor this huge responsability class

  # We have rules and questions
  # First we need to separate roman definition from credit definition
  # After figuring out intergalactic vs roman, we need to get intergalactics from Credits sentences
  # Then we need to translate roman to arabic
  # After all, we can figure out material multiplier value(Silver, Gold...), from Credits sentence
  # Then we can calculate and generate output

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

    raise MissingRulesError if rules.empty?
    raise MissingQuestionsError if questions.empty?

    @intergalactic_hash = mount_integalactic_hash
  end

  def answer_questions
    # TODO
    []
  end

  private
  attr_reader :rules, :questions, :intergalactic_hash


  # def arabic_from_intergalactic
  #   translated_values = NumeralConverter.intergalactic_to_roman(integalactic_hash(rules))
  # end

  # This would mount something like this:
  # {
  #   glob: I,
  #   pish: V,
  #   grok: X
  # }
  def mount_integalactic_hash
    hsh = {}

    rules.each do |rule|
      hsh.merge!(intergalactic_key_value(rule)) if intergalactic_sentence?
    end

    hsh
  end

  def intergalactic_sentence?
    !!rule.match(/\w+\sis\s\w/)
  end

  def intergalactic_key_value(rule)
    rule_array = rule.split(' ')
    arabic = NumeralConverter.roman_to_arabic(ROMAN_TO_ARABIC[rule_array.last.to_sym])

    { rule_array.first.to_sym => arabic }
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
end
