class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters
  TYPES =  %w(Kingdom City Place)

  self.inheritance_column = :changing_the_self_inheritance_column

  def cities
    if self.type = "Kingdom"
      Area.where(type: "City").where(area_id: self.id)
    else
      raise "Only a kingdom can have cities"
    end
  end

  def places
    if self.type = "City"
      Area.where(type: "Place").where(area_id: self.id)
    else
      raise "Only a city can have places"
    end
  end

  def area_name_for_lists
    "#{name}"
  end

  class << self

    def for(model)
      TYPES.each_with_index do |type, index|
        if model.type == type
          return [] if index == 0
          return Area.send(TYPES[index-1].downcase.pluralize)
        end
      end
    end

    def cities
      Area.where(type: 'City')
    end
    def places
      Area.where(type: 'Place')
    end
    def kingdoms
      Area.where(type: 'Kingdom')
    end
  end

  validates_presence_of :name
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end
