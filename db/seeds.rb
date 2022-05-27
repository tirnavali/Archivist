# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# doc_types = ["belge", "cd", "harita", "ferman", "mektup",]
# doc_types.each {|doc_type| DocumentType.create! name: doc_type}

# languages = %w{türkçe ingilizce almanca fransızca osmanlıca farsça}
# languages.each {|lang| Language.create! name: lang}

# organizations = ["Tarih Kurumu", "Kara Kuvvetleri Komutanlığı", "TBMM Kütüphane ve Arşiv Hizmetleri Başkanlığı"]
# organizations.each {|org| Organization.create! name: org}

# people = ["Ali Fehmi", "Ragıp Tüzün", "Hasan Tahsin", "Sercan Oğlu Tuna"]
# people.each {|p| Person.create! name: p}

# phisycal_statuses = %w{Yıpranmış Sağlam Restorasyonluk}
# phisycal_statuses.each { |status| PhisycalStatus.create! name: status}

# privacies = %w{Kamu Gizli Kripto Kozmik}
# privacies.each { |privacy| Privacy.create! name: privacy }

# subjects = %w{Felsefe Ekonomi Din Siyaset Fizik Kimya Kütüphanecilik Arşivcilik Göç İrtica}
# subjects.each { |subject| Subject.create! name: subject}

# toponyms = %w{Ankara İstanbul Kastamonu Sivas Isparta El-Cezire Suriye Irak İzmir Bandırma}
# toponyms.each {|toponym| Toponym.create! name: toponym}

# number_types = ["Esas No", "Karar No", "Kanun No", "Kadük No", "Dosya No", "Arşiv No", "Yasama Yılı", "Birleşim No", "Tefsir No", "Toplantı No", "Kanunlar Dergisi Cilt"]
# number_types.each {|nt| NumberType.create! name: nt}

# 25.times do |u|
    # User.create(email: "random#{u*2}@gmail.com", password: "123456", role: ((u+1)%3))
    # User.create(email: "standart#{u*2}@gmail.com", password: "123456")
# end
# fonds = ["CUMHURİYET HALK PARTİSİ", "CUMHURİYETÇİ GÜVEN PARTİSİ", "ADALET PARTİSİ", "MİLLİ SELAMET PARTİSİ", "MİLLİYETÇİ HAREKET PARTİSİ",
# "MİLLİ BİRLİK KURULU", "İSTİKLAL MAHKEMELERİ", "YASSI ADA - YÜCE DİVAN", "İSTİKLAL MADALYALARI", 
# "GAZETECİ NALAN SEÇKİN TARAFINDAN 1970 YILINDA İLK MECLİSİN 14 SAYIN ÜYESİ İLE YAPILAN GÖRÜŞME BANTLARI", "İSDEMİR KÖMÜR DOSYASI",
# "OYLAMA PULLARI", "MSB ASKERİ KADROLARA AİT DOSYALAR", "ATATÜRK İMZALI ÖZEL", "TBMM VAKFI", "TAKVİM-İ VAKAYİ", "ÜNVERSİTE SAYIŞTAY RAPORU", "RESMİ GAZETE", 
# "DÜSTUR", "TUTANAK DERGİLERİ", "KANUNLAR DERGİSİ", "TUTANAKLAR MECLİSİ MEBUSAN", "TUTANAKLAR MECLİSİ AYAN", "KOÇGİRİ"]
# fonds.each {|fond| Fond.create! name: fond}

# tutanaklar_f = Fond.create! name: "TUTANAKLAR"
# Fond.create! name: "GİZLİ OTURUM TUTANAKLARI", parent_id: tutanaklar_f.id
# Fond.create! name: "AÇILAN GİZLİ ZABITLAR", parent_id: tutanaklar_f.id
# Fond.create! name: "KİT KOMİSYONU", parent_id: tutanaklar_f.id
# Fond.create! name: "DİLEKÇE KOMİSYONU", parent_id: tutanaklar_f.id
# Fond.create! name: "İHTİSAS KARMA KOMİSYONLAR", parent_id: tutanaklar_f.id
# Fond.create! name: "İNSAN HAKLARI KOMİSYONU", parent_id: tutanaklar_f.id

# kanunlar_f = Fond.create! name: "KANUNLAR FONU"
# kaduk_f = Fond.create! name: "KADÜK", parent_id: kanunlar_f.id

rm = RecordMetadatum.new
rm.fond= Fond.first
rm.box= 1
rm.order = 2
rm.folder = 3
rm.organization_code = "TBM-12"
rm.summary="asdfasdf asdf asd asdf asdf sdf"
rm.explaination=""
rm.starting_date="22.10.1342"
rm.ending_date="26.11.1342"
rm.subjects << Subject.first
rm.people << Person.first
rm.organizations << Organization.first
rm.toponyms << Toponym.first
rm.save

xlsx = Roo::Spreadsheet.open('db/kocgiri1.xlsx')

#7th column person
person_list = xlsx.sheet(0).cell(3,7).split(",")
person_ids = []
person_list.each do |pers|
  pers = pers.squish # remove whitespaces
  pf = Person.find_by_name pers
  if pf.nil?
    p = Person.create! name: pers
    person_ids << p.id
  else
    person_ids << pf.id
  end
end
person_ids.uniq!
#end of 7th column
#8th column organization