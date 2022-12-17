json.extract! teacher, :id, :school_id, :login_id, :password, :name, :email, :address, :tel, :birthday, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
