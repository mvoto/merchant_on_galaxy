# Given intergalactics and credits info, this class figures out the arabic values for
# intergalactic info and mineral info(Silver, Gold, Iron)
class Translator
  attr_reader :intergalactic_hash, :mineral_hash, :questions

  def initialize(args = {})
    @intergalactics = args[:intergalactics]
    @credits        = args[:credits]
    @questions      = args[:questions]

    raise MissingRulesError if intergalactics.empty? || credits.empty?
    raise MissingQuestionsError if questions.empty?

    @intergalactic_hash = generate_intergalactics_hash
    @mineral_hash       = generate_minerals_hash
  end

  private
  attr_reader :intergalactics, :credits

  # This mounts something like this: { glob: I, pish: V , grok: X }
  def generate_intergalactics_hash
    hsh = {}
    intergalactics.each { |sentence| update_intergalactic_hash(hsh, sentence) }

    hsh
  end

  # This mounts something like this: { :Silver => 7, :Gold => 21, :Iron => 2 }
  def generate_minerals_hash
    hsh = {}
    credits.each { |credit| update_credit_hash(hsh, credit) }
    hsh
  end

  def update_intergalactic_hash(hsh, intergalactic)
    hsh[intergalactic.split(' ').first.to_sym] = intergalactic.split(' ').last
  end

  def update_credit_hash(hsh, credit)
    sentence_value = credit.split(/\s[A-Z][a-z]+/).first

    arabic       = arabic_value(sentence_value)
    credit_value = credit[/\d+(?=\sCredits)/]
    material     = credit[/\w+(?=\sis\s\d+\sCredits)/]

    hsh[material.to_sym] = credit_value.to_f / arabic
  end

  def arabic_value(sentence)
    roman = sentence.split(' ').map { |interg| intergalactic_hash[interg.to_sym] }.join
    NumeralConverter.roman_to_arabic(roman)
  end
end
