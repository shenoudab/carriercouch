require 'carrierwave'
require 'carriercouch/orm/couchrest_model'
require 'carriercouch/storage/couch'
require 'carriercouch/uploader/configuration'

CarrierWave.configure do |config|
  config.storage_engines[:couch] = 'CarrierWave::Storage::Couch'
  config.couch_host = 'localhost'
  config.couch_port = 5984
end
