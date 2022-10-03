class NumberType < ApplicationRecord
  audited
  
  def to_s
    self.name
  end

  def solrable_name
    return self.name.gsub(/\s/, '')
  end

  validates :name, uniqueness: { case_sensitive: false }
end
