namespace :active_storage do
    desc "Watermarks attached Active Storage blobs. Run regularly."
    task watermark_pdf: :environment do
      require "open-uri"
      files = Dir.glob("tmp/watermarked/*")

      ActiveStorage::Current.url_options= {protocol: "http", host: "127.0.0.1", port: "3000"}
      file = ActiveStorage::Blob.first
      place_number = file.attachments.first.record.record_metadatum.place_number
      io = URI.open(file.url)
      reader = PDF::Reader.new(io)
      hexio = HexaPDF::Document.open File.open(files[0])
#      hexio = HexaPDF::Document.open io

      
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
    
      temp_file = hexio.write(io, validate: false, optimize: true)
      hexio.write "result2.pdf"
      
      RecordMetadatum.find(12).record_attachment.images.attach(io: File.open("tmp/result.pdf"), filename: "#{file.filename.to_s}", content_type: "application/pdf")

      puts hexio.pages.count
      puts reader.info

      def add_pdf
        puts "0-------------------------------#{self.watermarked}"
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
        puts "9-------------------------------#{self.watermarked}"
      end
      
    end
  end
  