class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.int :intelligence
      t.string :eger
      t.integer :patience
      t.integer :charisma
      t.integer :strength
      t.integer :endurance
      t.integer :agility
      t.integer :constitution
      t.integer :gold
      t.string :weapon
      t.text :description
      t.text :history

      t.timestamps
    end
  end
end
