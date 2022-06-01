class HomeController < ApplicationController
  def index
    @q = RecordMetadatum.ransack(params[:q])
    
    if (params[:q]).nil?
      @q = RecordMetadatum.ransack(params[:q])
      @record_metadata = @q.result.page.limit 2 # burada sorun var :D
    else
      
      @record_metadata = @q.result.page params[:page]
    end
      # @record_metadata = (@q.result.includes(:fond, :subjects, :toponyms).page, params[:page])
  end

 
end
