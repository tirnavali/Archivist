class HomeController < ApplicationController
  def index
    #@user = User.new
    console
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

      # if params[:toponyms].present? 
      #   toponym_filter = with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      #   facet :toponyms, exclude: [toponym_filter]
      # else
      #   with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      #   facet :toponyms
      # end
      with(:toponyms, params[:toponyms]) if params[:toponyms].present?
      facet :toponyms

      if params[:organizations].present? 
        organization_filter = with(:organizations, params[:organizations]) if params[:organizations].present?
        facet :organizations, exclude: [organization_filter]
      else
        with(:organizations, params[:organizations]) if params[:organizations].present?
        facet :organizations
      end

      # if params[:fond].present? 
      #   fond_filter = with(:fond, params[:fond]) if params[:fond].present?
      #   facet :fond, exclude: [fond_filter]
      # else
      #   with(:fond, params[:fond]) if params[:fond].present?
      #   facet :fond
      # end
      #fond_filter = with(:fond_id, params[:fond_id])
      with(:fond_id, params[:fond_id]) if params[:fond_id].present?
      facet :fond_id #, exclude: [fond_filter]

      # if params[:organization_ids].present? 
      #   #org_filter = with(:organization_ids, params[:organization_ids]) if params[:organization_ids].present?
      #   facet :organization_ids
      # else
      #   with(:organization_ids, params[:organization_ids]) if params[:organization_ids].present?
      #   facet :organization_ids
      # end
      facet :organization_ids

            
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
