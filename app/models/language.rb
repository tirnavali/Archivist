class Language < ApplicationRecord
  audited
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :record_metadata, dependent: :nullify

  validates :name, uniqueness: true
    def to_s
        return self.name
    end
end
