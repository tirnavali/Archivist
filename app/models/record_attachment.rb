class RecordAttachment < ApplicationRecord
  before_save :set_page_count
  belongs_to :record_metadatum
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  private

  def set_page_count
    unless self.images.empty?
      io = URI.open(self.images.first.url)
      reader = PDF::Reader.new io
      self.page_count = reader.page_count
    else
      self.page_count = nil
    end
  end

end
