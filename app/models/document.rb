class Document < ApplicationRecord
  belongs_to :pub_type
  belongs_to :language
end
