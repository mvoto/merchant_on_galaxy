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
    @dictionary ||= {
      galaxy_unit: galaxy_units_hash,
      mineral: minerals_hash
    }
  end

  private
  attr_reader :galaxy_units, :credits

  # This mounts something like this: { glob: I, pish: V , grok: X }
  def galaxy_units_hash
    hsh = {}
    galaxy_units.each { |sentence| update_galaxy_unit_hash(hsh, sentence) }

    hsh
  end

  # This mounts something like this: { :Silver => 7, :Gold => 21, :Iron => 2 }
  def minerals_hash
    hsh = {}
    credits.each { |credit| update_credit_hash(hsh, credit) }

    hsh
  end

  def update_galaxy_unit_hash(hsh, galaxy_unit)
    hsh[galaxy_unit.split(' ').first.to_sym] = galaxy_unit.split(' ').last
  end

  def update_credit_hash(hsh, credit)
    credit_info = CreditInfo.new(credit)
    arabic      = arabic_value(credit_info.until_material_word)

    hsh[credit_info.material.to_sym] = material_value(credit_info, arabic)
  end

  def arabic_value(sentence)
    NumeralConverter.roman_to_arabic(roman(sentence))
  end

  def roman(sentence)
    sentence.split(' ').map { |interg| galaxy_units_hash[interg.to_sym] }.join
  end

  def material_value(credit_info, arabic)
    credit_info.value.to_f / arabic
  end
end
