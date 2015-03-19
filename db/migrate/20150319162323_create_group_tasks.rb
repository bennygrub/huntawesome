class CreateGroupTasks < ActiveRecord::Migration
  def change
    create_table :group_tasks do |t|
      t.integer :group_id
      t.integer :task_id

      t.timestamps
    end
  end
end
