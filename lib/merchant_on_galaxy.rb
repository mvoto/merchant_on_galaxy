Bundler.require :default

Dir['./lib/errors/*.rb'].each { |file| require file }
require  './lib/file_reader.rb'
require  './lib/translator.rb'
require  './lib/merchant_on_galaxy.rb'

# This module is the Application's entry point and flow's controller
class MerchantOnGalaxy

  # Reads input file to classify content as rules and questions
  # Setup translator and
  def self.run(input_file = './input_sample.txt')
    content_hash = FileReader.perform(input_file)
    translator   = Translator.new(content_hash)
    translation  = translator.answer_questions

    puts translation

    translation
  end

end
