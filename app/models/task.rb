class Task < ActiveRecord::Base
  has_many :completed_tasks
end
