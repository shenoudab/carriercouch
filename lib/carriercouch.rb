require 'carrierwave'
require 'carriercouch/orm/couchrest_model'
require 'carriercouch/storage/couch'

CarrierWave::Uploader::Base.add_config :couch_host
CarrierWave::Uploader::Base.add_config :couch_port
CarrierWave::Uploader::Base.add_config :couch_database
CarrierWave::Uploader::Base.add_config :couch_username
CarrierWave::Uploader::Base.add_config :couch_password
CarrierWave::Uploader::Base.add_config :couch_connection
CarrierWave::Uploader::Base.add_config :couch_access_url

CarrierWave.configure do |config|
  config.storage_engines[:couch] = 'CarrierWave::Storage::Couch'
  config.couch_host = 'localhost'
  config.couch_port = '5984'
end

module Carriercouch
  # Your code goes here...
end
