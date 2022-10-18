class CollectionItem < ApplicationRecord
  belongs_to :collection
  belongs_to :record_metadatum
end
