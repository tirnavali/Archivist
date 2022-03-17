class PubType < ApplicationRecord
  audited
  def to_s
    return self.name
  end
end
