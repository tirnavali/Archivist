class PhisycalStatus < ApplicationRecord
  has_many :metadata
  def to_s
    return self.name
  end    
end
