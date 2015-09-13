module RescueGroups
  class AnimalField
    FIELDS = {
      id:                        :animalID,
      organization_id:           :animalOrgID,
      activity_level:            :animalActivityLevel,
      adoption_fee:              :animalAdoptionFee,
      altered:                   :animalAltered,
      available_date:            :animalAvailableDate,
      birthdate:                 :animalBirthdate,
      birthdate_exact:           :animalBirthdateExact,
      breed:                     :animalBreed,
      coat_length:               :animalCoatLength,
      color:                     :animalColor,
      color_id:                  :animalColorID,
      color_details:             :animalColorDetails,
      courtesy:                  :animalCourtesy,
      declawed:                  :animalDeclawed,
      description:               :animalDescription,
      description_plain:         :animalDescriptionPlain,
      distinguishing_marks:      :animalDistinguishingMarks,
      ear_type:                  :animalEarType,
      energy_level:              :animalEnergyLevel,
      excercise_needs:           :animalExerciseNeeds,
      eye_color:                 :animalEyeColor,
      fence:                     :animalFence,
      found:                     :animalFound,
      found_date:                :animalFoundDate,
      found_postal_code:         :animalFoundPostalcode,
      general_age:               :animalGeneralAge,
      general_size_potential:    :animalGeneralSizePotential,
      grooming_needs:            :animalGroomingNeeds,
      house_trained:             :animalHousetrained,
      indoor_outdoor:            :animalIndoorOutdoor,
      kill_date:                 :animalKillDate,
      kill_reason:               :animalKillReason,
      location:                  :animalLocation,
      # location_distance:         :animalLocationDistance,
      location_city_state:       :animalLocationCitystate,
      microchipped:              :animalMicrochipped,
      mixed_breed:               :animalMixedBreed,
      name:                      :animalName,
      special_needs:             :animalSpecialneeds,
      special_needs_description: :animalSpecialneedsDescription,
      needs_foster:              :animalNeedsFoster,
      new_people:                :animalNewPeople,
      not_house_trained_reason:  :animalNotHousetrainedReason,
      obedience_training:        :animalObedienceTraining,
      ok_with_adults:            :animalOKWithAdults,
      ok_with_cats:              :animalOKWithCats,
      ok_with_dogs:              :animalOKWithDogs,
      ok_with_kids:              :animalOKWithKids,
      owner_experience:          :animalOwnerExperience,
      pattern:                   :animalPattern,
      pattern_id:                :animalPatternID,
      adoption_pending:          :animalAdoptionPending,
      primary_breed:             :animalPrimaryBreed,
      primary_breed_id:          :animalPrimaryBreedID,
      rescue_id:                 :animalRescueID,
      search_string:             :animalSearchString,
      secondary_breed:           :animalSecondaryBreed,
      secondary_breed_id:        :animalSecondaryBreedID,
      sex:                       :animalSex,
      shedding:                  :animalShedding,
      size_current:              :animalSizeCurrent,
      size_potential:            :animalSizePotential,
      size_uom:                  :animalSizeUOM,
      species:                   :animalSpecies,
      species_id:                :animalSpeciesID,
      sponsorable:               :animalSponsorable,
      sponsors:                  :animalSponsors,
      sponsorhip_details:        :animalSponsorshipDetails,
      sponsorship_minimum:       :animalSponsorshipMinimum,
      status:                    :animalStatus,
      status_id:                 :animalStatusID,
      summary:                   :animalSummary,
      tail_type:                 :animalTailType,
      thumbnail_url:             :animalThumbnailUrl,
      up_to_date:                :animalUptodate,
      updated_date:              :animalUpdatedDate,
      url:                       :animalUrl,
      vocal:                     :animalVocal,
      yard_required:             :animalYardRequired,
      affectionate:              :animalAffectionate,
      apartment:                 :animalApartment,
      crate_trained:             :animalCratetrained,
      drools:                    :animalDrools,
      eager_to_please:           :animalEagerToPlease,
      escapes:                   :animalEscapes,
      even_tempered:             :animalEventempered,
      fetches:                   :animalFetches,
      gentle:                    :animalGentle,
      good_in_car:               :animalGoodInCar,
      goofy:                     :animalGoofy,
      has_allergies:             :animalHasAllergies,
      hearing_impaired:          :animalHearingImpaired,
      hypoallergenic:            :animalHypoallergenic,
      independent:               :animalIndependent,
      intelligent:               :animalIntelligent,
      lap:                       :animalLap,
      leash_trained:             :animalLeashtrained,
      needs_companion_animal:    :animalNeedsCompanionAnimal,
      no_cold:                   :animalNoCold,
      no_female_dogs:            :animalNoFemaleDogs,
      no_heat:                   :animalNoHeat,
      no_large_dogs:             :animalNoLargeDogs,
      no_male_dogs:              :animalNoMaleDogs,
      no_small_dogs:             :animalNoSmallDogs,
      obedient:                  :animalObedient,
      ok_for_seniors:            :animalOKForSeniors,
      ok_with_farm_animals:      :animalOKWithFarmAnimals,
      older_kids_only:           :animalOlderKidsOnly,
      ongoing_medical:           :animalOngoingMedical,
      playful:                   :animalPlayful,
      plays_toys:                :animalPlaysToys,
      predatory:                 :animalPredatory,
      protective:                :animalProtective,
      sight_impaired:            :animalSightImpaired,
      skittish:                  :animalSkittish,
      special_diet:              :animalSpecialDiet,
      swims:                     :animalSwims,
      timid:                     :animalTimid,
      foster_email:              :fosterEmail,
      foster_first_name:         :fosterFirstname,
      foster_last_name:          :fosterLastname,
      foster_name:               :fosterName,
      foster_phone_cell:         :fosterPhoneCell,
      foster_phone_home:         :fosterPhoneHome,
      foster_salutation:         :fosterSalutation,
      location_addresss:         :locationAddress,
      location_city:             :locationCity,
      location_country:          :locationCountry,
      location_url:              :locationUrl,
      location_name:             :locationName,
      location_phone:            :locationPhone,
      location_state:            :locationState,
      location_postal_code:      :locationPostalcode,
      pictures:                  :animalPictures,
      videos:                    :animalVideos,
      video_urls:                :animalVideoUrls,
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