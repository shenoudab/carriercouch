require 'carrierwave'
require 'carriercouch/carrierwave/orm/couchrest_model'

module CarrierWave
  module Storage
    autoload :Couch, 'carriercouch/carrierwave/storage/couch'
  end
end

module Carriercouch
end
