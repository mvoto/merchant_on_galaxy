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
  # Setup translator and
  def self.run(input_file)
    content_hash = FileReader.perform(input_file)
    translator   = Translator.new(content_hash)
    answers      = Oracle.perform(translator)

    puts answers.join("\n")
  end
end
