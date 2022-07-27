class HomeController < ApplicationController
  def index
    @user = User.new

    @search = RecordMetadatum.search do 
      fulltext params[:query] do
        fields(params[:field]) if params[:field].present?
      end
      facet :subjects
      facet :toponyms
      with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      with(:subjects, params[:subjects]) if params[:subjects].present?
    end
    @record_metadata = @search.results
    if (params[:query]).nil?
      #@record_metadata = RecordMetadatum.limit(5)
    end
    if @record_metadata.empty?
      respond_to do |format|
        format.html { render :nothing_found , notice: "Aramanızda hiç bri sonuç bulunamadı." }
        format.json { head :no_content }
      end
    end
  end

  def basic_search
    @q = RecordMetadatum.ransack(params[:q])
    @record_metadata = @q.result.page params[:page]
  end

  def nothing_found
  end

 
end
