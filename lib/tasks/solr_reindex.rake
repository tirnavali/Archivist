namespace :solr do
  desc "Reindex solr models"
  task reindex: :environment do
    RecordMetadatum.reindex
  end
end