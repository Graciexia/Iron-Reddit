json.array!(@links) do |link|
  json.extract! link, :id, :post, :title, :belong_to, :
  json.url link_url(link, format: :json)
end
