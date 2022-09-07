class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  scope :new_to_old, -> {order(id: :desc)}
end
