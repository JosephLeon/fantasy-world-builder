class RemovePlaceIdFromAreas < ActiveRecord::Migration
  def change
    remove_column :areas, :planet_id, :string
    remove_column :areas, :continent_id, :string
    remove_column :areas, :kingdom_id, :string
    remove_column :areas, :city_id, :string
    remove_column :areas, :place_id, :string
    remove_column :areas, :area_type, :string
  end
end
