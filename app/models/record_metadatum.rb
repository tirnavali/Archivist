class RecordMetadatum < ApplicationRecord
  audited
  has_one :record_attachment
  belongs_to :fond
  belongs_to :organization  
  audited associated_with: :organization
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
  validates_presence_of :summary
  validates_length_of :explaination, in: 0..300
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates_presence_of :subjects, :document_types
  #validates_presence_of :languages
  
  accepts_nested_attributes_for :special_numbers, limit: 5, reject_if: :all_blank, allow_destroy: true
  validates_associated :special_numbers

  scope :sort_audits,-> (record_metadata_id) { Audit.joins("INNER JOIN record_metadata on audits.auditable_id = record_metadata.id ")
                            .where("record_metadata.id = ?", record_metadata_id).order("audits.version DESC")}
  
  def to_s
    "id: #{self.id} summary: #{self.summary}"
  end

end
