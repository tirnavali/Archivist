# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create!(email: "tran.ce.co@gmail.com", password: "123456")

doc_types = ["belge", "cd", "harita", "ferman", "mektup",]
doc_types.each {|doc_type| DocumentType.create! name: doc_type}

languages = %w{türkçe ingilizce almanca fransızca osmanlıca farsça}
languages.each {|lang| Language.create! name: lang}

organizations = ["Tarih Kurumu", "Kara Kuvvetleri Komutanlığı", "TBMM Kütüphane ve Arşiv Hizmetleri Başkanlığı"]
organizations.each {|org| Organization.create! name: org}

people = ["Ali Fehmi", "Ragıp Tüzün", "Hasan Tahsin", "Sercan Oğlu Tuna"]
people.each {|p| Person.create! name: p}

phisycal_statuses = %w{Yıpranmış Sağlam Restorasyonluk}
phisycal_statuses.each { |status| PhisycalStatus.create! name: status}

privacies = %w{Kamu Gizli Kripto Kozmik}
privacies.each { |privacy| Privacy.create! name: privacy }

subjects = %w{Felsefe Ekonomi Din Siyaset Fizik Kimya Kütüphanecilik Arşivcilik Göç İrtica}
subjects.each { |subject| Subject.create! name: subject}

toponyms = %w{Ankara İstanbul Kastamonu Sivas Isparta El-Cezire Suriye Irak İzmir Bandırma}
toponyms.each {|toponym| Toponym.create! name: toponym}

number_types = ["Esas No", "Karar No", "Kanun No", "Kadük No", "Dosya No", "Arşiv No", "Yasama Yılı", "Birleşim No", "Tefsir No", "Toplantı No", "Kanunlar Dergisi Cilt"]
number_types.each {|nt| NumberType.create! name: nt}

25.times do |u|
    User.create(email: "random#{u*2}@gmail.com", password: "123456", role: ((u+1)%3))
    User.create(email: "standart#{u*2}@gmail.com", password: "123456")
end
fonds = ["CUMHURİYET HALK PARTİSİ", "CUMHURİYETÇİ GÜVEN PARTİSİ", "ADALET PARTİSİ", "MİLLİ SELAMET PARTİSİ", "MİLLİYETÇİ HAREKET PARTİSİ",
"MİLLİ BİRLİK KURULU", "İSTİKLAL MAHKEMELERİ", "YASSI ADA - YÜCE DİVAN", "İSTİKLAL MADALYALARI", 
"GAZETECİ NALAN SEÇKİN TARAFINDAN 1970 YILINDA İLK MECLİSİN 14 SAYIN ÜYESİ İLE YAPILAN GÖRÜŞME BANTLARI", "İSDEMİR KÖMÜR DOSYASI",
"OYLAMA PULLARI", "MSB ASKERİ KADROLARA AİT DOSYALAR", "ATATÜRK İMZALI ÖZEL", "TBMM VAKFI", "TAKVİM-İ VAKAYİ", "ÜNVERSİTE SAYIŞTAY RAPORU", "RESMİ GAZETE", 
"DÜSTUR", "TUTANAK DERGİLERİ", "KANUNLAR DERGİSİ", "TUTANAKLAR MECLİSİ MEBUSAN", "TUTANAKLAR MECLİSİ AYAN", "KOÇGİRİ"]
fonds.each {|fond| Fond.create! name: fond}

tutanaklar_f = Fond.create! name: "TUTANAKLAR"
Fond.create! name: "GİZLİ OTURUM TUTANAKLARI", parent_id: tutanaklar_f.id
Fond.create! name: "AÇILAN GİZLİ ZABITLAR", parent_id: tutanaklar_f.id
Fond.create! name: "KİT KOMİSYONU", parent_id: tutanaklar_f.id
Fond.create! name: "DİLEKÇE KOMİSYONU", parent_id: tutanaklar_f.id
Fond.create! name: "İHTİSAS KARMA KOMİSYONLAR", parent_id: tutanaklar_f.id
Fond.create! name: "İNSAN HAKLARI KOMİSYONU", parent_id: tutanaklar_f.id

kanunlar_f = Fond.create! name: "KANUNLAR FONU"
kaduk_f = Fond.create! name: "KADÜK", parent_id: kanunlar_f.id

class String
  def titleize_turkish()
    word_list = self.split(" ")
    word_list.map!{|word| word[0].upcase(:turkic) + word[1..].downcase(:turkic) }
    word_list.join(" ")
  end
end

xlsx = Roo::Spreadsheet.open('db/kocgiri01.xlsx')
(2..260).each do |num|
  puts "Working on row :#{num}"
  rm = RecordMetadatum.new
  rm.fond= Fond.find_by_name("KOÇGİRİ")
  rm.organization_code = xlsx.sheet(0).cell(num,1)
  rm.box= xlsx.sheet(0).cell(num,2)
  rm.folder = xlsx.sheet(0).cell(num,3)
  rm.order = xlsx.sheet(0).cell(num,4)
  rm.starting_date= xlsx.sheet(0).cell(num,5)
  rm.summary= xlsx.sheet(0).cell(num,8)
  rm.explaination=""

  ## 9 column person
  xlsx_data = xlsx.sheet(0).cell(num,9)
  unless xlsx_data.nil?  
    person_list = xlsx_data.split(",")
  
    person_ids = []
    person_list.each do |pers|
      puts pers
      pers = pers.squish.titleize_turkish # remove whitespaces
      if pers.empty?
        next
      end
      # pf = Person.where("LOWER(name)=?", pers.downcase(:turkic))
      pf = Person.find_by_name pers

      if pf.nil?
        p = Person.create! name: pers
        person_ids << p.id
      else
        person_ids << pf.id
      end
    end
    person_ids.uniq!
    rm.person_ids =person_ids
  end
  

  ## 10. column organization
  xlsx_data = xlsx.sheet(0).cell(num,10)
  unless xlsx_data.nil? 
    organization_list = xlsx_data.split(",")
    organization_ids = []
    organization_list.each do |organization|
      organization = organization.squish.titleize_turkish # remove whitespaces
      if organization.empty? || organization.length <= 3
        next
      end
      org = Organization.find_by_name organization
      if org.nil?
        o = Organization.create! name: organization
        organization_ids << o.id
      else
        organization_ids << org.id
      end
    end
    organization_ids.uniq!

    rm.organization_ids = organization_ids
  end


  ## 11 toponym
  xlsx_data = xlsx.sheet(0).cell(num,11)
  unless xlsx_data.nil?  
    toponym_list = xlsx_data.split(",")
    toponym_ids = []
    toponym_list.each do |toponym|
        toponym = toponym.squish.titleize_turkish # remove whitespaces
      if toponym.empty?
        next
      end
      top = Toponym.find_by_name toponym
      if top.nil?
      begin
        t = Toponym.create! name: toponym
        toponym_ids << t.id
      rescue
      end
      else
        toponym_ids << top.id
      end
    end
    toponym_ids.uniq!
      rm.toponym_ids = toponym_ids
  end


  ## 12 subjects
  subject_list = xlsx.sheet(0).cell(num,12).split(",")
  subject_ids = []
  subject_list.each do |subject|
      subject = subject.squish.titleize_turkish # remove whitespaces
    if subject.empty?
      next
    end
    subj = Subject.find_by_name subject
    if subj.nil?
      s = Subject.create! name: subject
      subject_ids << s.id
    else
      subject_ids << subj.id
    end
  end
  subject_ids.uniq!
  rm.subject_ids = subject_ids
  rm.save
  # 
  
end # end of excel