class GroupTask < ActiveRecord::Base
  has_many :task_documentations
  accepts_nested_attributes_for :task_documentations, :reject_if => :all_blank, :allow_destroy => true
end