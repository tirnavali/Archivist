class Privacy < ApplicationRecord
  audited
  has_and_belongs_to_many :documents
  has_many :record_metadata, dependent: :nullify
  def to_s
    return self.name
  end  
end
