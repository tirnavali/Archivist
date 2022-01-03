class Document < ApplicationRecord
  belongs_to :pub_type
  belongs_to :language
  belongs_to :organization
  belongs_to :subject
  belongs_to :phisycal_status
  belongs_to :document_type
end
