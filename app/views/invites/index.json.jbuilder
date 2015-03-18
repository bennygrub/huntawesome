json.array!(@invites) do |invite|
  json.extract! invite, :id, :email, :group_id
  json.url invite_url(invite, format: :json)
end
