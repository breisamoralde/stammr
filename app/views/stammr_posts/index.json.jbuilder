json.array!(@stammr_posts) do |stammr_post|
  json.extract! stammr_post, :content
  json.url stammr_post_url(stammr_post, format: :json)
end
