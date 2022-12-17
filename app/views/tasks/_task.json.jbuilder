json.extract! task, :id, :school_id, :teacher_id, :student_id, :start, :finish, :end, :content, :comment, :created_at, :updated_at
json.url task_url(task, format: :json)
