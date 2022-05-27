class Fond < ApplicationRecord
  audited
  before_validation :clean_white_spaces
  before_create :assign_depth
  before_save   :assign_depth

  
  belongs_to :parent, class_name: "Fond", optional: true
  has_many :children, class_name: "Fond", foreign_key: "parent_id", dependent: :nullify
  has_many :record_metadata

  validates :name, uniqueness: { case_sensitive: false }
  validates_presence_of :name
  validates_length_of :name, in: 3..150
  validates :depth, presence: true, numericality: true


  def to_s
    self.name
  end

  def children_to_s
    self.children.join(", ")
  end


  private
  
    def assign_depth
      self.depth = (self.parent.present? ? parent.depth + 1 : 0)
    end
    
    def clean_white_spaces
      self.name.squish!
    end
end
