# This class receives the input file, reads it and separates file content into
# intergalactics, credits and questions hash
class FileReader
  def self.perform(input_file)
    validate_file(input_file)
    @input_lines = File.read(input_file).split(/\n/)

    { intergalactics: intergalactics, credits: credits, questions: questions }
  end

  private
  class << self
    attr_reader :input_lines
  end

  def self.validate_file(input_file)
    raise InvalidInputError, 'weird file input' unless File.file?(input_file)
  end

  def self.intergalactic?(sentence)
    !credit?(sentence) && !question?(sentence)
  end

  def self.credit?(sentence)
    sentence.end_with?('Credits')
  end

  def self.question?(sentence)
    sentence.end_with?('?')
  end

  def self.intergalactics
    input_lines.select { |line| intergalactic?(line) }
  end

  def self.credits
    input_lines.select { |line| credit?(line) }
  end

  def self.questions
    input_lines.select { |line| question?(line) }
  end
end
