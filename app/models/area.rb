class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters

  has_many :cities, :foreign_key => 'city_id',
                    :class_name => 'Bearing',
                    :dependent => :destroy
  has_many :places, :foreign_key => 'place_id',
                    :class_name => 'Bearing',
                    :dependent => :destroy

  def area_name_for_lists
    "#{name}"
  end

  # def self.get_type
  #   area_types = {

  #   }
  # end

  validates_presence_of :name
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end
