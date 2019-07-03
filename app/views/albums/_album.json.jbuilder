json.extract! album, :id, :poster, :title, :description, :list_image, :created_at, :updated_at
json.url album_url(album, format: :json)
