json.extract! record_metadatum, :id, :summary, :created_at, :updated_at
json.url record_metadatum_url(record_metadatum, format: :json)
