# This class receives the input file, reads it and separates file content into rules and
# questions
class FileReader
  def self.perform(input_file)
    @input_file = input_file

    validate_file
    @input_lines    = File.read(input_file).split(/\n/)
    @intergalactics = input_lines.select { |line| intergalactic?(line) }
    @questions      = input_lines.select { |line| question?(line) }
    @credits        = input_lines.select { |line| credit?(line) }
    validate_content

    { intergalactics: intergalactics, credits: credits, questions: questions }
  end

  private
  class << self
    attr_reader :input_file, :input_lines, :intergalactics, :credits, :questions
  end

  def self.validate_file
    raise InvalidInputError unless File.file?(input_file)
  end

  def self.validate_content
    if intergalactics.empty? || credits.empty? || questions.empty?
      raise InvalidContentError
    end
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
end
