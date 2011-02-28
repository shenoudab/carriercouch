require 'carrierwave'
require 'carrierwave/orm/couchrest_model'
require 'carrierwave/storage/couch'
require 'carrierwave/uploader/configuration'

module CarrierWave
  module Storage
    autoload :Couch, 'carrierwave/storage/couch'
  end
end
