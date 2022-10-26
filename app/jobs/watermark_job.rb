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
          page_width = page.box.width
          page_height = page.box.height
          puts "Source page size : #{page_width}x#{page_height}"
          overlay_canvas = page.canvas(type: :overlay)
          overlay_canvas.fill_color(0, 0, 0).
          font('Helvetica', variant: :bold, size: 8).
          opacity(fill_alpha: 0.45, stroke_alpha: 0.6).
          save_graphics_state.
          translate(20, 10).rotate(0).
          text(stamp, at: [0, 0]).
          restore_graphics_state.
          fill_color(255, 255, 255).
          text(stamp, at: [120, 10]).
          save_graphics_state.
          fill_color(0, 0, 0).
          rotate(0).text(stamp, at: [220, 10]).
          fill_color(255, 255, 255).
          text(stamp, at: [320, 10]).
          fill_color(0, 0, 0).
          text(stamp, at: [420, 10]).
          fill_color(255, 255, 255).
          text(stamp, at: [520, 10]).
          line(0, 22, page_width, 22).stroke.
          line(0, 20, page_width, 20).stroke.
          line(0, 5, page_width, 5).stroke.
          line(0, 3, page_width, 3).stroke
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
          watermark_file(file_url= image.url, stamp= "#{ra.record_metadatum.organization_code}_#{ra.record_metadatum.place_number}", export_path= "#{temp_dir_path}/#{i}.pdf")
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
