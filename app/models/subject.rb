class Subject < ApplicationRecord
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :record_metadata, dependent: :nullify


  #validates :name, uniqueness: {case_sensitive: false, message: "should be unique"}
  
  def to_s
    return self.name
  end
end
