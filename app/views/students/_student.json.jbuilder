json.extract! student, :id, :nickname, :first_name, :last_name, :created_at, :updated_at
json.url student_url(student, format: :json)
