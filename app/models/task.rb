class Task < ActiveRecord::Base
  has_many :completed_tasks
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/task-missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
