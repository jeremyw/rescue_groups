module RescueGroups
  class BreedField
    FIELDS = {
      id:                   :breedID,
      name:                 :breedName,
      species:              :breedSpecies,
      species_id:           :breedSpeciesID,
    }.freeze

    # method: all
    # purpose: Return the values of FIELDS for easy use in
    #            requesting fields from the remote API
    # param: none
    # return: <Array[Symbol]> - All defined field names
    def self.all
      FIELDS.values
    end
  end
end
