class Fond < ApplicationRecord
  before_create :assign_depth
  before_save   :assign_depth

  
  belongs_to :parent, class_name: "Fond", optional: true
  has_many :children, class_name: "Fond", foreign_key: "parent_id"
  has_many :documents
  has_many :metadata

  validates :name, uniqueness: true

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
  
end
