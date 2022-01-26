class Document < ApplicationRecord
  belongs_to :pub_type
  has_and_belongs_to_many :languages
  belongs_to :organization  
  belongs_to :phisycal_status
  has_and_belongs_to_many :document_types
  has_and_belongs_to_many :toponyms
  has_and_belongs_to_many :privacies
  has_and_belongs_to_many :people
  belongs_to :special_number
  has_and_belongs_to_many :subjects
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates :organization_code, :box, :order, :summary, :starting_date ,presence: true 
  
end