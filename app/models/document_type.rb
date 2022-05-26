class DocumentType < ApplicationRecord
  before_validation :clean_white_spaces
  has_and_belongs_to_many :record_metadata, dependent: :nullify

  validates :name, uniqueness: { case_sensitive: false }
  validates_presence_of :name
  validates_length_of :name, in: 3..20
  
  def to_s
    return self.name
  end

  def clean_white_spaces
    self.name.squish!
  end
end
