class Universe < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :items, dependent: :destroy

  validates_presence_of :name, :description
  validates_length_of :name,  :maximum => 128,
                              :too_long => "Can't be more than 128 characters."

  mount_uploader :map, MapUploader

  def universe_name_for_lists
    "#{name}"
  end
end
