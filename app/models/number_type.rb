class NumberType < ApplicationRecord
  audited
  has_and_belongs_to_many :fonds
  def to_s
    self.name
  end

  def solrable_name
    return self.name.gsub(/\s/, '')
  end

  validates :name, uniqueness: { case_sensitive: false }
end
