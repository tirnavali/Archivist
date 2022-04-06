class Toponym < ApplicationRecord
  audited
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :record_metadata, dependent: :nullify
  validates :name, uniqueness: true
  validates_presence_of :name
  validates_length_of :name, in: 3..100
  def to_s
    return self.name
  end
end
