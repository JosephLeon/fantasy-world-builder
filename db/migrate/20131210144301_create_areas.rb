class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.text :description
      t.string :map
      t.text :notes
      t.integer :universe_id
      t.text :environment

      t.timestamps
    end
  end
end
