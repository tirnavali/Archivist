class Person < ApplicationRecord
  has_and_belongs_to_many :documents
  def to_s
    return self.name
  end
end
