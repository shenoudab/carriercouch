require 'carrierwave'

module CarrierWave
  module Uploader
    module Configuration
      
      included do
        add_config :couch_host
        add_config :couch_port
        add_config :couch_database
        add_config :couch_username
        add_config :couch_password
        add_config :couch_connection
        add_config :couch_access_url

        configure do |config|
          config.storage_engines = {
            :couch => "CarrierWave::Storage::Couch"
          }
          config.couch_host = 'localhost'
          config.couch_port = 5984
        end
      end
    end
  end
end
