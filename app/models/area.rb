class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters

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
        # ['Planet',1],
        # ['Continent',2],
        # ['Kingdom',3],
        # ['City',4],
        # ['Place',5],
        # ['Dungeon', 6]
      ]
      #types_array = ['Planet','Continent','Kingdom','City/Village','Place','Dungeon']
    end
  end

  validates_presence_of :name, :description
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end
