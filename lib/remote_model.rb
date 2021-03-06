require_relative './api_client'
require_relative '../lib/queryable'
require_relative '../lib/relationable'
require_relative '../models/picture'

module RescueGroups
  class RemoteModel
    include ApiClient
    include Queryable
    include Relationable

    # method: initialize
    # purpose: given a hash of attributes, assign the attributes that the
    #            included model has defined and discard the rest
    # param: attribute_hash - <Hash> - hash of attributes to instantiate
    #          this model with
    # return: nil
    def initialize(attribute_hash = {})
      (attribute_hash || {}).each do |key, value|
        mapped_key = self.class.object_fields::FIELDS.key(key.to_sym)
        mapped_method = "#{ mapped_key }="
        next unless self.respond_to?(mapped_method)
        self.send(mapped_method, cast_attribute_to_type(mapped_key, value))
      end
    end

    def cast_attribute_to_type(name, value)
      return value.to_i if name.to_s == 'id' || name =~ /_id/

      value
    end

    # method: attributes
    # purpose: Distill the included class's attributes into a hash of keys and values
    #          If an attribute is nil, the key for that attribute is still included
    #            in the resulting hash and the value is nil
    # param: none
    # return: <Hash> of attributes from the included class
    def attributes
      {}.tap do |hash|
        self.class.object_fields::FIELDS.keys.each do |attribute|
          hash[attribute] = instance_variable_get(:"@#{ attribute }")
        end
      end
    end
  end
end
