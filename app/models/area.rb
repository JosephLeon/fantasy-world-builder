class Area < ActiveRecord::Base
  belongs_to :universe
  has_many :characters
  validates_presence_of :name, :description
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."
end
