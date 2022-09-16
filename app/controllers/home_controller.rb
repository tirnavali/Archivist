class HomeController < ApplicationController
  def index
    #@user = User.new
    console
    @search = RecordMetadatum.search do 
      fulltext params[:query] do
        fields(params[:field]) if params[:field].present?
      end
      
      if params[:fond_id].present? 
        fond_filter = with(:fond_id, params[:fond_id].values )
        facet :fond_id ,exclude: [fond_filter]
      else
        facet :fond_id
      end

      if params[:subject_ids].present? 
        subject_filter = with(:subject_ids, params[:subject_ids].values) 
        facet :subject_ids , exclude: [subject_filter]
      else
        facet :subject_ids 
      end

      if params[:organization_ids].present? 
        organization_filter = with(:organization_ids, params[:organization_ids].values) 
        facet :organization_ids , exclude: [organization_filter]
      else
        facet :organization_ids 
      end

      if params[:person_ids].present? 
        person_filter = with(:person_ids, params[:person_ids].values) 
        facet :person_ids , exclude: [person_filter]
      else
        facet :person_ids 
      end

      if params[:toponym_ids].present? 
        toponym_filter = with(:toponym_ids, params[:toponym_ids].values) 
        facet :toponym_ids , exclude: [toponym_filter]
      else
        facet :toponym_ids 
      end

      # if params[:toponyms].present? 
      #   toponym_filter = with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      #   facet :toponyms, exclude: [toponym_filter]
      # else
      #   with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      #   facet :toponyms
      # end
            
      paginate page: params[:page], per_page: 10
    end
    @subjects = @search.facet(:subjects)
    @toponyms = @search.facet(:toponyms)
    @organizations = @search.facet(:organizations)
    @fonds = @search.facet(:fond)
    @organization_ids = @search.facet(:organization_ids)

    
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
