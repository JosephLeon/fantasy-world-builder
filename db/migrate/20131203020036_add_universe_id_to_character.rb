class AddUniverseIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :universe_id, :integer
  end
end
