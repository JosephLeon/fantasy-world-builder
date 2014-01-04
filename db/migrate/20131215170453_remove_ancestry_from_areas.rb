class RemoveAncestryFromAreas < ActiveRecord::Migration
  def change
    remove_column :areas, :ancestry, :string
  end
end
