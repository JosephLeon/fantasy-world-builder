class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters

  # has_many :areas
  # belongs_to :area



  def area_name_for_lists
    "#{name}"
  end

  class << self
    def area_types
      types_array = [
        ['Planet'],
        ['Continent'],
        ['Kingdom'],
        ['City'],
        ['Place'],
        ['Dungeon']
      ]
    end
  end

  validates_presence_of :name, :description
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end

class Planet < Area
  has_many :continents
end

class Continent < Area
  belongs_to :planet
  has_many :kingdoms
end

class Kingdom < Area
  has_many :cities
  has_many :places
  belongs_to :continent
end

class City < Area
  has_many :places
  belongs_to :kingdom
end

class Place < Area
  belongs_to :city
  belongs_to :kingdom
end
