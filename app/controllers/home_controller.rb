class HomeController < ApplicationController
  def index
    @q = RecordMetadatum.ransack(params[:q])
    @record_metadata = @q.result.includes(:fond, :subjects)
    @record_metadata = RecordMetadatum.order(:created_at).limit 5
  end


end
