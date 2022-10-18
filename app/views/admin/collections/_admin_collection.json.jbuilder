json.extract! admin_collection, :id, :title, :user_id, :created_at, :updated_at
json.url admin_collection_url(admin_collection, format: :json)
