# encoding: utf-8

require 'couchrest'
require 'couchrest_model'

module CarrierWave
  module Storage

    ##
    # Couch storage stores file to the Couchdb (surprising, no?). There's really not much
    # to it.
    #
    # Creating a connection looks something like this:
    #
    #     CarrierWave.configure do |config|
    #       config.storage = :couch
    #       config.couch_host = "your-host.com"
    #       config.couch_port = "5984"
    #       config.couch_database = "your_dbs_app_name"
    #       config.couch_username = "user"
    #       config.couch_password = "verysecret"
    #       config.couch_access_url = "/images"
    #     end
    #
    #   In the above example your documents url will look like:
    #
    #      http://your-app.com:5984/:database/:document_id/:document-identifier-here
    #
    # When you already have a CouchDB connection object :
    #
    #     CarrierWave.configure do |config|
    #       config.storage = :couchdb
    #       config.couch_connection = model.use_database
    #       config.couch_access_url = "/images"
    #     end
    #
    class Couch < Abstract
      class File
        def initialize(uploader, path)
          @uploader = uploader
          @path = path
        end

        ##
        # Returns the current path of the file on S3
        #
        # === Returns
        #
        # [String] A path
        #
        def path
          @path
        end

        ##
        # Reads the contents of the file from S3
        #
        # === Returns
        #
        # [String] contents of the file
        #
        def read
          result = model.fetch_attachment(@path)
          @headers = result.headers
          result.body
        end

        ##
        # Remove the file from Amazon S3
        #
        def delete
          model.delete_attachment(@path)
        end

        ##
        # Returns the url on CouchDB
        #
        # === Returns
        #
        # [String] content's url
        #
        def url
          ["http://" + @uploader.couch_host + ":" + @uploader.couch_port, model.database.name , model.id, @path].join("/")
        end

        def store(file)
          content_type ||= file.content_type # this might cause problems if content type changes between read and upload (unlikely)
          model.put_attachment(path.sub(/\//, ''), file.read, {:content_type => content_type})
        end

        def content_type
          headers["Content-Type"]
        end

        def content_type=(type)
          headers["Content-Type"] = type
        end

        def size
          headers['Content-Length'].to_i
        end

        # Headers returned from file retrieval
        def headers
          @headers
        end

        private

        def model
          @uploader.model
        end
      end

      ##
      # Move the file to the uploader's store path.
      #
      # === Parameters
      #
      # [file (CarrierWave::Storage::Couch::File)] the file to store
      #
      # === Returns
      #
      # [CarrierWave::Storage::Couch::File] a couch file
      #
      def store!(file)
        f = CarrierWave::Storage::Couch::File.new(uploader, uploader.store_path)
        f.store(file)
        f
      end

      ##
      # Retrieve the file from its store path
      #
      # === Parameters
      #
      # [identifier (String)] the filename of the file
      #
      # === Returns
      #
      # [CarrierWave::Storage::Couch::File] a couch file
      #
      def retrieve!(identifier)
        CarrierWave::Storage::Couch::File.new(uploader, uploader.store_path(identifier))
      end

    end # Couch
  end # Storage
end # CarrierWave
