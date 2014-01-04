class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :description
      t.string :map
      t.string :notes
      t.integer :population
      t.string :economy
      t.string :building_style
      t.integer :year_founded
      t.string :resources
      t.string :government

      t.timestamps
    end
  end
end
