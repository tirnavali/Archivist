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
  has_many :special_numbers #, dependent: :destroy
  
  
  validates_presence_of :box, :order, numericality: true
  validates_presence_of :organization_code, :starting_date
  validates_length_of :summary, in: 10..300
  validates_length_of :explaination, in: 0..300
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates_presence_of :subjects, :document_types
  validates_presence_of :special_numbers
  validates_presence_of :languages
  
  accepts_nested_attributes_for :special_numbers, limit: 3, reject_if: :all_blank, allow_destroy: true
  
  def to_s
    "id: #{self.id} summary: #{self.summary}"
  end

end
