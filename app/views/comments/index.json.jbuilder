json.array!(@comments) do |comment|
  json.extract! comment, :content, :name, :stammr_post_id, :date_created
  json.url comment_url(comment, format: :json)
end
