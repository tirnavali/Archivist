class SolrReindexJob < ApplicationJob
  queue_as :default

  rescue_from(NoMethodError) do |exception|
    puts "The model is not configured with solr."
  end
  
  def perform(model)
    model.reindex
  end
end