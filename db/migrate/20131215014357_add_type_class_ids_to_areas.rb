class AddTypeClassIdsToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :planet_id, :string
    add_column :areas, :continent_id, :string
    add_column :areas, :kingdom_id, :string
    add_column :areas, :city_id, :string
    add_column :areas, :place_id, :string
  end
end
