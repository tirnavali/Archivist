class Organization < ApplicationRecord
  audited
  has_many :record_metadata, dependent: :nullify

  validates :name, uniqueness: true
  def to_s
    return self.name
  end
end
