class AddGroupTaskIdToTaskDocumentation < ActiveRecord::Migration
  def change
    add_column :task_documentations, :group_task_id, :integer
  end
end
