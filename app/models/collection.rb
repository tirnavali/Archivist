class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items
  has_many :record_metadata, :through => :collection_items

  
  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 100 }

  def to_s
    title
  end
end
