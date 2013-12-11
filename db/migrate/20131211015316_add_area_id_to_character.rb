class AddAreaIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :area_id, :integer
  end
end
