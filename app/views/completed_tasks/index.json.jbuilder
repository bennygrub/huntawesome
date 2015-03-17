json.array!(@completed_tasks) do |completed_task|
  json.extract! completed_task, :id, :user_id, :group_id, :task_id
  json.url completed_task_url(completed_task, format: :json)
end
