json.extract! record_attachment, :id, :completed, :created_at, :updated_at
json.url record_attachment_url(record_attachment, format: :json)
