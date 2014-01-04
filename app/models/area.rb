class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters

  has_many :areas
  belongs_to :area

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

  validates_presence_of :name
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end
