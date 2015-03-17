json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :points, :requirements, :level
  json.url task_url(task, format: :json)
end
