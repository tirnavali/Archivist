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
  has_many_attached :images do |attachable|
<<<<<<< HEAD
    attachable.variant :thumb, resize_to_limit: [100,100]    
=======
    attachable.variant :thumb, resize_to_limit: [100, 100]
>>>>>>> 9c3d0ba77b6dc652e28e2832c3ecdf173f7dd623
  end
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates :organization_code, :box, :order, :summary, :starting_date ,presence: true 
  
end