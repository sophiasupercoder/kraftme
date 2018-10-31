json.extract! product, :id, :product_title, :description, :price, :medium, :quantity, :creator, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
