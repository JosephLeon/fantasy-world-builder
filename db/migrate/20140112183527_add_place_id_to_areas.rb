class AddPlaceIdToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :place_id, :integer
  end
end
