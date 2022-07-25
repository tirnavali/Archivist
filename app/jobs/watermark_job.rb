class WatermarkJob < ApplicationJob
  queue_as :default

  def perform(record_attachment)
    Dir.mkdir("tmp/watermarked") unless File.exists? "tmp/watermarked"
    require "open-uri"
    ActiveStorage::Current.url_options= {protocol: "http", host: "127.0.0.1", port: "3000"}
    def watermark_file(file_url, stamp, export_path)
      begin
        io = URI.open(file_url)
        hexio = HexaPDF::Document.open io
          
        hexio.pages.each do |page|
          overlay_canvas = page.canvas(type: :overlay)
          overlay_canvas.fill_color(38, 97, 157).
          font('Helvetica', size: 30).
          opacity(fill_alpha: 0.3, stroke_alpha: 0.8).
          save_graphics_state.
          translate(170, 330).rotate(0).
          text(stamp, at: [0, -320]).
          restore_graphics_state.
          translate(170, 470).rotate(0).
          text(stamp, at: [0, 0])
        end
        hexio.write(export_path)
      rescue OpenURI::HTTPError => ex
        puts "File not found: #{file_url}"
      end
    end
    ra = record_attachment
    temp_dir_path = "tmp/watermarked/record_attachment_#{ra.id}"
    Dir.mkdir(temp_dir_path) unless File.exists? temp_dir_path
    ra.images.each_with_index do |image, i|
      filename = image.filename.to_s
        if image.content_type.include? "pdf"
          watermark_file(file_url= image.url, stamp= ra.record_metadatum.place_number, export_path= "#{temp_dir_path}/#{i}.pdf")
          file = File.open("#{temp_dir_path}/#{i}.pdf")
          ra.watermarked_images.attach(
            io: file,
            filename: filename,
            content_type: image.content_type
          )
        end
      end
      ra.toggle! :watermarked
      ra.images.purge
      FileUtils.remove_dir temp_dir_path
    end
end
