json.extract! review, :id, :user_id, :content_id, :score, :comment, :watch_date, :watch_method_id, :watch_with_id, :created_at, :updated_at
json.url review_url(review, format: :json)
