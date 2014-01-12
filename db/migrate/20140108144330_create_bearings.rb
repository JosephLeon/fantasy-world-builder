class CreateBearings < ActiveRecord::Migration
  def change
    create_table :bearings do |t|
      t.integer :city_id
      t.integer :kingdom_id
      t.integer :place_id

      t.timestamps
    end
  end
end
