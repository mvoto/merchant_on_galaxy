# Given intergalactics and credits info, this class figures out the arabic values for
# intergalactic info and mineral info(Silver, Gold, Iron)
class Translator
  attr_reader :dictionary, :questions

  def initialize(args = {})
    @intergalactics = args[:intergalactics]
    @credits        = args[:credits]
    @questions      = args[:questions]
  end

  def dictionary
    @dictionary ||= {
      intergalactic: intergalactics_hash,
      mineral: minerals_hash
    }
  end

  private
  attr_reader :intergalactics, :credits

  # This mounts something like this: { glob: I, pish: V , grok: X }
  def intergalactics_hash
    hsh = {}
    intergalactics.each { |sentence| update_intergalactic_hash(hsh, sentence) }

    hsh
  end

  # This mounts something like this: { :Silver => 7, :Gold => 21, :Iron => 2 }
  def minerals_hash
    hsh = {}
    credits.each { |credit| update_credit_hash(hsh, credit) }
    hsh
  end

  def update_intergalactic_hash(hsh, intergalactic)
    hsh[intergalactic.split(' ').first.to_sym] = intergalactic.split(' ').last
  end

  def update_credit_hash(hsh, credit)
    credit_info = CreditInfo.new(credit)
    arabic      = arabic_value(credit_info.until_material_word)

    hsh[credit_info.material.to_sym] = credit_info.value.to_f / arabic
  end

  def arabic_value(sentence)
    roman = sentence.split(' ').map { |interg| intergalactics_hash[interg.to_sym] }.join
    NumeralConverter.roman_to_arabic(roman)
  end
end
