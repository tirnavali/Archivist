namespace :active_storage do
    desc "Watermarks attached Active Storage blobs. Run regularly."
    task watermark_pdf: :environment do
      ActiveStorage::Current.url_options= {protocol: "http", host: "127.0.0.1", port: "3000"}
      file = ActiveStorage::Blob.first.url
      io = URI.open(file)
      reader = PDF::Reader.new(io)
      hexio = HexaPDF::Document.open io

      
      hexio.pages.each do |page|
        overlay_canvas = page.canvas(type: :overlay)
        overlay_canvas.fill_color(201, 10, 43).
          font('Helvetica', size: 50).
          opacity(fill_alpha: 0.4, stroke_alpha: 0.9).
          save_graphics_state.
          translate(170, 330).rotate(0).
          text("TBMM", at: [0, -320]).
          restore_graphics_state.
          translate(170, 470).rotate(-30).
          text("TBMM", at: [0, 0])
      end
   



      hexio.write "result1.pdf"

      puts hexio.pages.count
      puts reader.info
    end
  end
  