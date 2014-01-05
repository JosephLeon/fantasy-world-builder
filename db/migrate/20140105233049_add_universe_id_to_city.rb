class AddUniverseIdToCity < ActiveRecord::Migration
  def change
    add_column :cities, :universe_id, :integer
  end
end
