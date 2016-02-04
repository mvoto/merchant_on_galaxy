require 'simplecov'

SimpleCov.start do
  minimum_coverage 90
  refuse_coverage_drop
  add_filter "/spec/"
end
require 'pry'

Dir['./lib/errors/*.rb'].each { |file| require file }
require  './lib/numeral_converter.rb'
require  './lib/file_reader.rb'
require  './lib/credit_info.rb'
require  './lib/question_info.rb'
require  './lib/translator.rb'
require  './lib/oracle.rb'
require './lib/merchant_on_galaxy.rb'

RSpec.configure do |config|
  config.color = true
end
