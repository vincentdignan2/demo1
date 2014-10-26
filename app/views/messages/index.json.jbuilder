json.array!(@messages) do |message|
  json.extract! message, :id, :message, :user_id, :message_from
  json.url message_url(message, format: :json)
end
