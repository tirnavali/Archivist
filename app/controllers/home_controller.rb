class HomeController < ApplicationController
  def index
    @record_metadata = RecordMetadatum.order(:created_at).limit 5
  end
end
