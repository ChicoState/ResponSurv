json.array!(@questions) do |question|
  json.extract! question, :id, :type, :section_id, :sequence_id, :user_id
  json.url question_url(question, format: :json)
end
