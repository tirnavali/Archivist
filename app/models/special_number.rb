class SpecialNumber < ApplicationRecord
  #belongs_to :document
  belongs_to :number_type
  belongs_to :record_metadatum

  def to_s
    return self.name
  end
end
