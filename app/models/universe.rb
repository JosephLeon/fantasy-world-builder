class Universe < ActiveRecord::Base
  has_many :characters, dependent: :destroy
end
