json.array!(@tasks) do |task|
  json.extract! task, :id, :owner_id, :request_at, :finish_at, :result, :check_result, :checker_id, :check_at, :url
  json.url task_url(task, format: :json)
end
