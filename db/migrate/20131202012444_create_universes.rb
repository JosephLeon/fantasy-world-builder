class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name
      t.text :description
      t.text :special_rules
      t.text :pantheon

      t.timestamps
    end
  end
end
