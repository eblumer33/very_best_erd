json.extract! dish, :id, :dish_name, :cuisine_type, :created_at, :updated_at
json.url dish_url(dish, format: :json)
