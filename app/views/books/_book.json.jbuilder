json.extract! book, :id, :title, :description, :author_id, :theme_id, :editorial_id, :created_at, :updated_at
json.url book_url(book, format: :json)
