class RecordMetadatum < ApplicationRecord
  has_one :record_attachment
  belongs_to :fond
  belongs_to :organization  
  belongs_to :phisycal_status
  belongs_to :privacy
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :document_types
  has_and_belongs_to_many :toponyms
  has_and_belongs_to_many :people
  has_many :special_numbers
  
  
  
  validates_presence_of :box, :order, numericality: true
  validates_presence_of :organization_code, :starting_date
  validates_length_of :summary, in: 10..300
  validates_length_of :explaination, in: 0..300
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates_presence_of :subjects, :languages, :document_types
  
  

  def to_s
    "id: #{self.id} summary: #{self.summary}"
  end
end
