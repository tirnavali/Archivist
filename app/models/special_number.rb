class SpecialNumber < ApplicationRecord
  belongs_to :document
  def to_s
    return self.name
  end
end
