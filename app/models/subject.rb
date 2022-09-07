class Subject < ApplicationRecord
  before_validation :clean_white_spaces
  audited
  has_and_belongs_to_many :record_metadata, dependent: :nullify
  paginates_per 10

  validates :name, uniqueness: { case_sensitive: false }
  validates_presence_of :name
  validates_length_of :name, in: 3..50
  default_scope {order(id: :desc)}

  def self.to_xlsx
    io = StringIO.new
    xlsx = Xlsxtream::Workbook.new(io)
    
    xlsx.write_worksheet 'Sheet1' do |sheet|
      sheet << column_names
      # Iterate all the rows which belongs to Model
      all.each do |subject|
        sheet << subject.attributes.values_at(*column_names)
      end
    end
    xlsx.close
    io.string
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.find_each do |subject|
        csv << subject.attributes.values_at(*column_names)
      end
    end
  end

  def to_s
    return self.name
  end

  def clean_white_spaces
    self.name.squish!
  end
end
