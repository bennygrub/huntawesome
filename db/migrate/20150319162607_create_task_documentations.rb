class CreateTaskDocumentations < ActiveRecord::Migration
  def change
    create_table :task_documentations do |t|
      t.text :description

      t.timestamps
    end
  end
end
