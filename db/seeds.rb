# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# subjects = %w{ekonomi tarih tıp teknoloji sosyal_bilimler siyaset din  }
# subjects.each {|subject| Subject.create! name: subject }

doc_types = %w{belge cd harita ferman mektup}
doc_types.each {|doc_type| DocumentType.create! name: doc_type}

languages = %w{türkçe ingilizce almanca fransızca osmanlıca farsça}
languages.each {|lang| Language.create! name: lang}

organizations = ["Tarih Kurumu", "TBMM Başkanlığı", "TBMM Kütüphane ve Arşiv Hizmetleri Başkanlığı"]
organizations.each {|org| Organization.create! name: org}

people = ["Ali Fehmi", "Ragıp Tüzün", "Hasan Tahsin", "Sercan Oğlu Tuna"]
people.each {|p| Person.create! name: p}

phisycal_statuses = %w{Yıpranmış Sağlam Restorasyonluk}
phisycal_statuses.each { |status| PhisycalStatus.create! name: status}

privacies = %w{Gizli Çok_Gizli Kripto Kozmik}
privacies.each { |privacy| Privacy.create! name: privacy }

pub_types = %w{Belge Cd Fotoğraf Fotokopi Film}
pub_types.each {|pub_type| PubType.create! name: pub_type }

# special_numbers = %w{Kararlar Kanunlar Sıra_Sayısı}
# special_numbers.each { |number| SpecialNumber.create! name: number}

subjects = %w{Felsefe Tarih Ekonomi Din Siyaset Fizik Kimya Kütüphanecilik Arşivcilik Göç İrtica}
subjects.each { |subject| Subject.create! name: subject}

toponyms = %w{Ankara İstanbul Kastamonu Sivas Isparta El-Cezire Suriye Irak İzmir}
toponyms.each {|toponym| Toponym.create! name: toponym}

number_types = ["Esas No", "Karar No", "Kanun No", "Kadük No", "Dosya No", "Arşiv No", "Yasama Yılı", "Birleşim No", "Tefsir No", "Toplantı No", "Kanunlar Dergisi Cilt"]
number_types.each {|nt| NumberType.create! name: nt}