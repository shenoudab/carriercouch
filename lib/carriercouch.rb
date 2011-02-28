require 'carrierwave'
require 'carrierwave/orm/couchrest_model'

module CarrierWave
  module Storage
    autoload :Couch, 'carrierwave/storage/couch'
  end
end

module Carriercouch
end