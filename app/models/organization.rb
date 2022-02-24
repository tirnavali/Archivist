class Organization < ApplicationRecord
  has_many :record_metadata, dependent: :nullify
  def to_s
    return self.name
  end
end
