class NumeralConverter
  ROMAN_TO_ARABIC = {
    1    => 'I',
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    10   => 'X',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    100  => 'C',
    400  => 'CD',
    500  => 'D',
    900  => 'CM',
    1000 => 'M'
  }

  def self.roman_to_arabic(value)
    value = value.upcase
    result = 0
    ROMAN_TO_ARABIC.values.reverse.each do |roman|
      # TODO: refactor this
      while value.start_with?(roman)
        value = value.slice(roman.length, value.length)
        result += ROMAN_TO_ARABIC.key(roman)
      end
    end

    result
  end

  # This is used for Credits sentence
  def self.intergalactic_to_roman(intergalactic_values, value)
    intergalactic_values.split(' ').map { |value| intergalactic_values_hash[value] }
  end
end