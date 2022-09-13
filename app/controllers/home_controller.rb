class HomeController < ApplicationController
  def index
    #@user = User.new

    @search = RecordMetadatum.search do 
      fulltext params[:query] do
        fields(params[:field]) if params[:field].present?
      end

      if params[:subjects].present? 
        subject_filter = with(:subjects, params[:subjects]) 
        facet :subjects , exclude: [subject_filter]
        
      else
        with(:subjects, params[:subjects]) if params[:subjects].present?
        facet :subjects 
      end

      if params[:toponyms].present? 
        toponym_filter = with(:toponyms, params[:toponyms]) if params[:toponyms].present?
        facet :toponyms, exclude: [toponym_filter]
      else
        with(:toponyms, params[:toponyms]) if params[:toponyms].present?
        facet :toponyms
      end

            
      paginate page: params[:page], per_page: 10
    end
    @subjects = @search.facet(:subjects).rows
    @toponyms = @search.facet(:toponyms).rows

    
    @record_metadata = @search.results
    if (params[:query]).nil?
      #@record_metadata = RecordMetadatum.limit(5)
    end

    if @record_metadata.empty?
      respond_to do |format|
        format.html { render :nothing_found , notice: "Aramanızda hiç bir sonuç bulunamadı." }
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

  def search_clues
  end

 
end
