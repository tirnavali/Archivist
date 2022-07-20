class RecordAttachment < ApplicationRecord

  before_save :process_pdf, :add_pdf

  belongs_to :record_metadatum

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many_attached :watermarked_images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  private

  def set_page_count
    unless self.images.empty?
      require 'open-uri'
      io = URI.open(self.images.first.url)
      reader = PDF::Reader.new io
      self.page_count = reader.page_count
    else
      self.page_count = nil
    end
  end

  def process_pdf
    require "open-uri"
    file = self.images.first.blob
    place_number = self.record_metadatum.place_number
    io = URI.parse(file.url).open
    hexio = HexaPDF::Document.open io
    
    hexio.pages.each do |page|
      overlay_canvas = page.canvas(type: :overlay)
      overlay_canvas.fill_color(201, 10, 43).
      font('Helvetica', size: 24).
      opacity(fill_alpha: 0.4, stroke_alpha: 0.9).
      save_graphics_state.
      translate(170, 330).rotate(0).
      text(place_number, at: [0, -320]).
      restore_graphics_state.
      translate(170, 470).rotate(-30).
      text("TBMM", at: [0, 0])
    end

    hexio.write "tmp/watermarked/#{self.record_metadatum.id}_#{self.id}_#{file.filename.to_s}"
    #temp_file = hexio.write(io, validate: false, optimize: true)
    #self.images.attach(io: File.open("tmp/result.pdf"), filename: "#{file.filename.to_s}", content_type: "application/pdf")
  end

  def add_pdf
    puts "-------------------------------#{self.watermarked}"
    unless self.watermarked
      file = self.images.first.blob
      self.watermarked_images.attach(
        io: File.open("tmp/watermarked/#{self.record_metadatum.id}_#{self.id}_#{file.filename.to_s}"),
        filename: file.filename.to_s,
        content_type: "application/pdf"
        )
      self.watermarked = true
      self.save
    end
    puts "-------------------------------#{self.watermarked}"

    #self.images.attach(io: File.open("tmp/result.pdf"), filename: "tempTemp.pdf", content_type: "application/pdf")
  end

end
