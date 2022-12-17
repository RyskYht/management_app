json.extract! lesson, :id, :school_id, :room_id, :name, :start, :end, :content, :hourly_pay, :monthly_pay, :month, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
