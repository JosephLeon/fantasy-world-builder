class AddAreaIdToArea < ActiveRecord::Migration
  def change
    add_column :areas, :area_id, :integer
  end
end
