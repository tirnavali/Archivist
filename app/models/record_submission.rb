class RecordSubmission < ApplicationRecord
  belongs_to :record_metadatum, dependent: :destroy
  belongs_to :user
end
