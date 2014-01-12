class Bearing < ActiveRecord::Base
  belongs_to :city,     :class_name => "Area"
  belongs_to :kingdom,  :class_name => "Area"
end
