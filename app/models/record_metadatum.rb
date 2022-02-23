class RecordMetadatum < ApplicationRecord
  has_one :record_attachment

  validates_length_of :summary, in: 10..300
  def to_s
    "id: #{self.id} summary: #{self.summary}"
  end
end
