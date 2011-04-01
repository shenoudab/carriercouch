require 'carrierwave'
require 'carriercouch/orm/couchrest_model'
require 'carriercouch/storage/couch'
require 'carriercouch/uploader/configuration'

#module CarrierWave
#  module Storage
#    autoload :Couch, 'carrierwave/storage/couch'
#  end
#end

CarrierWave.configure do |config|
  config.storage_engines[:couch] = 'CarrierWave::Storage::Couch'
end

module Carriercouch
  # Your code goes here...
end
