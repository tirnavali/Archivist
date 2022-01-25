class Document < ApplicationRecord
  belongs_to :pub_type
  belongs_to :language
  belongs_to :organization  
  belongs_to :phisycal_status
  belongs_to :document_type
  belongs_to :toponym
  belongs_to :privacy
  belongs_to :person
  belongs_to :special_number
  has_and_belongs_to_many :subjects
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  
end