# This class receives the input file, reads it and separates file content into rules and
# questions
class FileReader
  def self.perform(input_file)
    @input_file = input_file

    validate_file
    @input_lines = File.read(input_file).split(/\n/)
    @rules       = input_lines.reject { |line| question?(line) }
    @questions   = input_lines.select { |line| question?(line) }
    validate_content

    { rules: rules, questions: questions }
  end

  private
  class << self
    attr_reader :input_file, :input_lines, :rules, :questions
  end

  def self.validate_file
    raise InvalidInputError unless File.file?(input_file)
  end

  def self.validate_content
    raise InvalidContentError if rules.empty? || questions.empty?
  end

  def self.question?(sentence)
    sentence.end_with?('?')
  end
end
