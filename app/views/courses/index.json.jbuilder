json.array!(@courses) do |course|
  json.extract! course, :id, :course_code
  json.url course_url(course, format: :json)
end
