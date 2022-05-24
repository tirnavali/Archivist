class RecordSubmission < ApplicationRecord
  belongs_to :record_metadatum
  belongs_to :user
end
