class CreditInfo
  attr_reader :until_material_word, :value, :material

  def initialize(credit)
    @material            = credit[/\w+(?=\sis\s\d+\sCredits)/]
    @value               = credit[/\d+(?=\sCredits)/]
    @until_material_word = credit[/.*(?=\s#{material})/]
  end
end
