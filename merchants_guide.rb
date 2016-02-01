#!/usr/bin/env ruby
Dir['./lib/errors/*.rb'].each { |file| require file }
require  './lib/merchant_on_galaxy.rb'

MerchantOnGalaxy.run(ARGV[0])
