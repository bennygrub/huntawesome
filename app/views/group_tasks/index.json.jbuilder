json.array!(@group_tasks) do |group_task|
  json.extract! group_task, :id, :group_id, :task_id
  json.url group_task_url(group_task, format: :json)
end
