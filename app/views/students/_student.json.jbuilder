json.extract! student, :id, :school_id, :family_id, :login_id, :password, :name, :email, :tel, :birthday, :school_name, :grade, :admission_date, :expulsion_date, :memo, :created_at, :updated_at
json.url student_url(student, format: :json)
