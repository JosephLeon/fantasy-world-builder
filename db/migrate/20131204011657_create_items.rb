class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :appearance
      t.integer :weight
      t.string :size
      t.integer :damage
      t.integer :durability
      t.text :powers
      t.text :notes
      t.integer :character_id
      t.integer :monster_id
      t.integer :area_id

      t.timestamps
    end
  end
end
