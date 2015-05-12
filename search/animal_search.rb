require_relative './filter'
require_relative './animal_field'

class AnimalSearch
  attr_accessor :start, :limit, :sort, :order,
                :calc_found_rows, :fields, :filters

  def initialize(start = 0, limit = 10, sort = :animalID, order = :asc, fields = AnimalField.all)
    @start           = start
    @limit           = limit
    @sort            = sort
    @order           = order
    @calc_found_rows = 'Yes'
    @fields          = fields
    @filters         = []
  end

  def add_filter(name, assertion, equals)
    @filters << Filter.new(filter_name(name), assertion, filter_value(equals))
  end

  def filter_name(name)
    AnimalField::FIELDS[name]
  end

  def filter_value(value)
    {
      available: :Available,
    }[value.to_sym] || value
  end

  def as_json(*args)
    {
      resultStart:   start,
      resultLimit:   limit,
      resultSort:    sort,
      resultOrder:   order,
      calcFoundRows: calc_found_rows,
      filters:       filters.map(&:as_json),
      fields:        fields
    }
  end

  def to_json(*)
    JSON(as_json)
  end
end
