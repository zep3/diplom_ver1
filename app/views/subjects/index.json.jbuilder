json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :course, :semester
  json.url subject_url(subject, format: :json)
end
