class Item < ActiveRecord::Base
  belongs_to :character
  belongs_to :universe
  default_scope -> { order('name ASC') }
end
