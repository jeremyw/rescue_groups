require 'httparty'
require_relative './response'

module RescueGroups
  class RecordNotFound < StandardError; end

  class RemoteClient
    include HTTParty

    debug_output $stdout

    base_uri 'https://api.rescuegroups.org/http/json'
    headers 'Content-Type' => 'application/json'
    default_params apikey: RescueGroups.config.apikey

    class << self
      private

      def post_body(action)
        {
          objectAction: action,
          objectType:   object_type,
        }
      end

      def post_and_respond(post_body)
        response = post(base_uri, { body: JSON(post_body.merge(default_params)) })

        Response.new(response)
      end
    end
  end
end
