class AddMapToUniverse < ActiveRecord::Migration
  def change
    add_column :universes, :map, :string
  end
end
