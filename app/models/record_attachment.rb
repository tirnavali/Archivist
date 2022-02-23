class RecordAttachment < ApplicationRecord
  belongs_to :record_metadatum
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

end
