class Item < ActiveRecord::Base
  belongs_to :character
  default_scope -> { order('name ASC') }
end
