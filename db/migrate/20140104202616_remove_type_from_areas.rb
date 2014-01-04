class RemoveTypeFromAreas < ActiveRecord::Migration
  def change
    remove_column :areas, :type, :string
  end
end
