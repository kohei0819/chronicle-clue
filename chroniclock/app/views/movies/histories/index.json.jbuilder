json.array!(@movies_histories) do |movies_history|
  json.extract! movies_history, :id
  json.url movies_history_url(movies_history, format: :json)
end
