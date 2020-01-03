require_relative './base_search'
require_relative '../fields/breed_field'

module RescueGroups
  class BreedSearch < BaseSearch
    # method: fields
    # purpose: Return the the list of fields to request for this class for
    #            the remote call to RescueGroups
    # param: none
    # return: <Array[Symbol]> - All field names pertinent to this class
    def self.fields
      BreedField::FIELDS
    end
  end
end
