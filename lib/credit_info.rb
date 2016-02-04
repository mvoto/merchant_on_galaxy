class CreditInfo
  attr_reader :until_mineral_word, :value, :mineral

  def initialize(credit_sentence)
    @mineral             = credit_sentence[/\w+(?=\sis\s\d+\sCredits)/]
    @value               = credit_sentence[/\d+(?=\sCredits)/]
    @until_mineral_word  = credit_sentence[/.*(?=\s#{mineral})/]
  end
end
