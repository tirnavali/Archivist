class Fond < ApplicationRecord
  belongs_to :parent, class_name: "Fond", optional: true
  has_many :children, class_name: "Fond", foreign_key: "parent_id"

  def to_s
    self.name
  end

  def children_to_s
    self.children.join(", ")
  end
  
end
