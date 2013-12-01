class AddDetailsToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :health, :integer
    add_column :characters, :armor, :integer
    add_column :characters, :level, :integer
    add_column :characters, :career, :string
    add_column :characters, :attack, :integer
    add_column :characters, :defense, :integer
    add_column :characters, :perception, :integer
    add_column :characters, :weight, :integer
    add_column :characters, :weight_penalty, :integer
    add_column :characters, :race, :string
    add_column :characters, :clan, :string
    add_column :characters, :spells, :text
    add_column :characters, :abilities, :text
    add_column :characters, :skills, :text
    add_column :characters, :powers, :text
    add_column :characters, :languages, :text
    add_column :characters, :magic_save, :integer
    add_column :characters, :mind_save, :integer
    add_column :characters, :weather_save, :integer
    add_column :characters, :poison_save, :integer
    add_column :characters, :force_save, :integer
    add_column :characters, :notes, :text
  end
end
