class RemoveUniverseIdFromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :universe_id, :string
  end
end
