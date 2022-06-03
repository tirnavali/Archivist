class HomeController < ApplicationController
  def index
    @search = RecordMetadatum.search do 
      fulltext params[:query]
    end
    @record_metadata = @search.results
    if (params[:query]).nil?
      #@record_metadata = RecordMetadatum.limit(5)
    end
  end

  def basic_search
    @q = RecordMetadatum.ransack(params[:q])
    @record_metadata = @q.result.page params[:page]
  end

 
end
