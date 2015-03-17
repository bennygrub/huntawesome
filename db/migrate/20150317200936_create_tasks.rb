class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.text :requirements
      t.integer :level

      t.timestamps
    end
  end
end
