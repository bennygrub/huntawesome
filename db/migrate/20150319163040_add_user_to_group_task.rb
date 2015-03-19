class AddUserToGroupTask < ActiveRecord::Migration
  def change
    add_column :group_tasks, :user_id, :integer
  end
end
