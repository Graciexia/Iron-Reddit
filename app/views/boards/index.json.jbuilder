json.array!(@boards) do |board|
  json.extract! board, :id, :category
  json.url board_url(board, format: :json)
end
