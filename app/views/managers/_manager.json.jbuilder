json.extract! manager, :id, :login_id, :password, :created_at, :updated_at
json.url manager_url(manager, format: :json)
