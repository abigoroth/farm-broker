json.extract! comment, :id, :comment_message, :comment_date, :created_at, :updated_at
json.url comment_url(comment, format: :json)