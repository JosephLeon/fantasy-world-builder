class AddCityIdToArea < ActiveRecord::Migration
  def change
    add_column :areas, :city_id, :integer
  end
end
