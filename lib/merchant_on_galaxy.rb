Bundler.require :default

Dir['./lib/errors/*.rb'].each { |file| require file }
Dir['./lib/regex_extractors/*.rb'].each { |file| require file }
Dir['./lib/utils/*.rb'].each { |file| require file }

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
    translator   = Translator.new(content_hash)
    answers      = Oracle.perform(translator)

    answers.join("\n")
  rescue InvalidInputError, InvalidContentError => error
    puts "Sorry, something went wrong: #{error.message}"
  end
end
