class TaskDocumentation < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_task
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing-documentation.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
