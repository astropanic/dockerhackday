json.array!(@problems) do |problem|
  json.extract! problem, :id, :title, :description, :input, :output
  json.url problem_url(problem, format: :json)
end
