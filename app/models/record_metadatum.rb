class RecordMetadatum < ApplicationRecord
  searchable do
    boolean :is_secret
    text :special_numbers do 
      special_numbers.map{ |no| no.to_solr_index }
    end

    string :special_value, :multiple => true, :references => SpecialNumber do
      special_numbers.map(&:value)
    end

    string :special_number_type, :multiple => true, :references => SpecialNumber do
      special_numbers.map(&:solrable_number_type_name)
    end
    
    string  :organization_code do
      organization_code.upcase(:turkic)
    end
    integer :box
    integer :folder
    integer :order
    integer :fond_scope_id do
      fond_id
    end
    integer :fond_id,           :multiple => true, :references => Fond
    integer :subject_ids,       :multiple => true, :references => Subject
    integer :organization_ids,  :multiple => true, :references => Organization
    integer :person_ids,        :multiple => true, :references => Person
    integer :toponym_ids,       :multiple => true, :references => Toponym
    integer :document_type_ids, :multiple => true
    integer :language_ids,      :multiple => true
    integer :privacy_id
    integer :phisycal_status_id
    time :starting_date
    time :ending_date
    time :created_at
    time :updated_at
    text :summary
    text :explaination

    text :toponyms do
      toponyms.map{ |toponym| toponym} 
    end

    text :subjects do
      subjects.map{ |subject| subject} 
    end


    text :people do
      people.map{ |person| person.name} 
    end

    text :organizations do
      (organizations.map{ |organization| organization.name})
    end
    
  end

  before_validation :assign_default_values
  after_create :save_submission
  audited
  has_one :record_attachment, dependent: :destroy
  belongs_to :fond
  #audited associated_with: :organization
  belongs_to :phisycal_status
  belongs_to :privacy
  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :document_types
  has_and_belongs_to_many :toponyms
  has_and_belongs_to_many :people
  has_many :special_numbers #, dependent: :destroy
  has_one :record_submission, dependent: :destroy
  has_one :user, through: :record_submission
  
  
  validates_presence_of :box, :order, numericality: true
  validates_presence_of :organization_code, :starting_date
  validates_length_of :summary, in: 10..300
  validates_presence_of :summary
  validates_length_of :explaination, in: 0..300
  validates_comparison_of :ending_date, greater_than: :starting_date, allow_nil: true
  validates_presence_of :subjects, :document_types
  #validates_presence_of :languages
  #validates_presence_of :special_numbers must be opened later
  
  accepts_nested_attributes_for :special_numbers, limit: 5, reject_if: :all_blank, allow_destroy: true
  validates_associated :special_numbers

  paginates_per 10


  scope :sort_audits,-> (record_metadata_id) { Audit.joins("INNER JOIN record_metadata on audits.auditable_id = record_metadata.id ")
                            .where("record_metadata.id = ?", record_metadata_id).order("audits.version DESC")}
   

  def to_s
    "id: #{self.id} fond: #{self.fond.name} summary: #{self.summary}"
  end

  def self.fields_and_related_model_fields
    fields = []
    fields = RecordMetadatum.attribute_names.collect{|f| f}
    fields.concat RecordMetadatum.reflect_on_all_associations.collect {|p| p.name.to_s.tableize }
    fields
  end

  def save_submission
    if Current.user.nil?
      # if record saved from console, attach first superadmin to record
      found_user_id = User.where(superadmin: true).first.id
    else
      found_user_id = Current.user.id
    end
    RecordSubmission.create!(record_metadatum_id: self.id, user_id: found_user_id)
  end

  def assign_default_values
    if self.privacy == nil
      self.privacy= (Privacy.find_by_name("Kamu") || Privacy.first)
    end
    if self.phisycal_status == nil
      self.phisycal_status = (PhisycalStatus.find_by_name("Sağlam") || PhisycalStatus.first)
    end
    if self.document_types.empty?
      self.document_types << (DocumentType.find_by_name("Belge") || DocumentType.first)
    end
    if self.languages.empty?
      self.languages << (Language.find_by_name("türkçe") || Language.first)
    end
  end

  def document_types_to_s
    self.document_types.join(", ") 
  end

  def place_number
    # K: Kutu, D: Dosya, G: Gömlek
    "K#{self.box}_D#{self.folder}_G#{self.order}"
  end

end
