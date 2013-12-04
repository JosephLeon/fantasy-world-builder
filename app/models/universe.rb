class Universe < ActiveRecord::Base
  has_many :characters, dependent: :destroy

  def universe_name_for_character
    "#{name}"
  end
end
