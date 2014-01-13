class AddTypeToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :type, :string
  end
end
