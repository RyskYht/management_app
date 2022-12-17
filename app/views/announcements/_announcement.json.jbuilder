json.extract! announcement, :id, :school_id, :start, :end, :title, :content, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
