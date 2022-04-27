class SpecialNumber < ApplicationRecord
  audited
  #belongs_to :document
  belongs_to :number_type
  belongs_to :record_metadatum
  validates_presence_of :value

  def to_s
    return self.value
  end
end
