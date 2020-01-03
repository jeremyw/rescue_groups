module RescueGroups
  class StatusField
    FIELDS = {
      id:                   :statusID,
      name:                 :statusName,
      description:          :statusDescription,
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
