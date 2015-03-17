json.array!(@group_users) do |group_user|
  json.extract! group_user, :id, :user_id, :group_id
  json.url group_user_url(group_user, format: :json)
end
