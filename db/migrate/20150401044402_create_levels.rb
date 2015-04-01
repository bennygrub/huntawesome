class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.text :description
      t.integer :pillar
      t.integer :points

      t.timestamps
    end
  end
end
