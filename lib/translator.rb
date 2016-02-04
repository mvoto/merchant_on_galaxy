# Given galaxy units and credits info, this class figures out the arabic values for
# galaxy unit info and mineral info(Silver, Gold, Iron)
class Translator
  attr_reader :dictionary, :questions

  def initialize(args = {})
    @galaxy_units   = args[:galaxy_units]
    @credits        = args[:credits]
    @questions      = args[:questions]
  end

  def dictionary
    @dictionary ||= { galaxy_unit: galaxy_units_hash, mineral: minerals_hash }
  end

  private
  attr_reader :galaxy_units, :credits

  # This mounts something like this: { glob: I, pish: V , grok: X }
  def galaxy_units_hash
    galaxy_units.each_with_object({}) do |sentence, hsh|
      hsh[sentence.split(' ').first.to_sym] = sentence.split(' ').last
    end
  end

  # This mounts something like this: { :Silver => 7, :Gold => 21, :Iron => 2 }
  def minerals_hash
    credits.each_with_object({}) { |sentence, hsh| update_credit_hash(sentence, hsh) }
  end

  def update_credit_hash(sentence, hsh)
    credit_info = initialize_credit_info(sentence)
    arabic      = arabic_value(credit_info.until_mineral_word)

    hsh[credit_info.mineral.to_sym] = mineral_value(credit_info, arabic)
  end

  def arabic_value(sentence)
    NumeralConverter.roman_to_arabic(roman(sentence))
  end

  def roman(sentence)
    sentence.split(' ').map { |interg| galaxy_units_hash[interg.to_sym] }.join
  end

  def mineral_value(credit_info, arabic)
    credit_info.value.to_f / arabic
  end

  def initialize_credit_info(sentence)
    CreditInfo.new(sentence)
  end
end
