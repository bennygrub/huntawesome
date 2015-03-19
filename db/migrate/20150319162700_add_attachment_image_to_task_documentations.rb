class AddAttachmentImageToTaskDocumentations < ActiveRecord::Migration
  def self.up
    change_table :task_documentations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :task_documentations, :image
  end
end
