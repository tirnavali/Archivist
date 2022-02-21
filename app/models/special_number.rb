class SpecialNumber < ApplicationRecord
  belongs_to :document
  belongs_to :number_type

  def to_s
    return self.name
  end
end
