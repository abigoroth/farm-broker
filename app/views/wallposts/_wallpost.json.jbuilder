json.extract! wallpost, :id, :wall_status, :wall_date, :created_at, :updated_at
json.url wallpost_url(wallpost, format: :json)