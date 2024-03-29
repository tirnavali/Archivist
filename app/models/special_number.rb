class SpecialNumber < ApplicationRecord
  audited

  belongs_to :number_type
  belongs_to :record_metadatum
  
  validates_presence_of :value

  def to_s
    return self.value
  end

  def to_solr_index
    return self.number_type.name + " " + self.value 
  end

  def solrable_number_type_name
    return self.number_type.name.gsub(/\s/, '')
  end

  def number_type_name
    return self.number_type.name
  end
end
