json.array!(@tests) do |test|
  json.extract! test, :id, :name, :chair, :course, :group, :content, :cover
  json.url test_url(test, format: :json)
end
