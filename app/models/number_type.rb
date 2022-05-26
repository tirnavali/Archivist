class NumberType < ApplicationRecord
  audited
  
  def to_s
    self.name
  end

  validates :name, uniqueness: { case_sensitive: false }
end
