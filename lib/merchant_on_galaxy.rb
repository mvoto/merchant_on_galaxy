Bundler.require :default

Dir['./lib/errors/*.rb'].each { |file| require file }
require  './lib/numeral_converter.rb'
require  './lib/file_reader.rb'
require  './lib/translator.rb'
require  './lib/oracle.rb'
require  './lib/merchant_on_galaxy.rb'

# This module is the Application's entry point and flow's controller
class MerchantOnGalaxy
  # Reads input file to classify content as rules and questions
  # Setup translator and ask Oracle to answer questions with translated dictionary
  def self.run(input_file)
    content_hash = FileReader.perform(input_file)
    dictionary   = Translator.new(content_hash)
    answers      = Oracle.perform(dictionary)

    answers.join("\n")
  rescue InvalidInputError, InvalidContentError, MissingQuestionsError,
    MissingRulesError => e
    puts "Sorry, something went wrong: #{e.message}"
  end
end
