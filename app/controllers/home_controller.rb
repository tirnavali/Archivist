class HomeController < ApplicationController
  def index
    #@user = User.new
    #console
    @search = RecordMetadatum.search do 
      fulltext params[:query] do
        fields( [:field]) if params[:field].present?
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

      with(:starting_date).between(params[:starting_date_from]..params[:starting_date_to]) if params[:starting_date_from].present? && params[:starting_date_to].present?
      with(:ending_date).between(params[:ending_date_from]..params[:ending_date_to]) if params[:ending_date_from].present? && params[:ending_date_to].present?
      with(:created_at).between(params[:created_at_from]..params[:created_at_to]) if params[:created_at_from].present? && params[:created_at_to].present?
      with(:updated_at).between(params[:updated_at_from]..params[:updated_at_to]) if params[:updated_at_from].present? && params[:updated_at_to].present?
      with :document_type_ids, params[:document_type_ids].filter_map {|val| val.to_i if val.length > 0  } if params[:document_type_ids].present?
      with :privacy_id, params[:privacy_id] if params[:privacy_id].present?
      with :phisycal_status_id, params[:phisycal_status_id] if params[:phisycal_status_id].present?
      
      with :organization_code, params[:organization_code].upcase(:turkic) if params[:organization_code].present?
      with :box, params[:box] if params[:box].present?
      with :folder, params[:folder] if params[:folder].present?
      with :order, params[:order] if params[:order].present?
      
      if params[:is_secret].present? && params[:not_secret].present?
        with :is_secret
      elsif params[:is_secret].present?
        with :is_secret, params[:is_secret] 
      elsif params[:not_secret].present?
        with :is_secret, false if params[:not_secret] == "false"
      end
      

      paginate page: params[:page], per_page: 10
    end
    @subjects_facet = @search.facet(:subject_ids)
    @toponyms_facet = @search.facet(:toponym_ids)
    @organizations_facet = @search.facet(:organization_ids)
    @person_facet = @search.facet(:person_ids)
    @fonds = @search.facet(:fond)

    
    @record_metadata = @search.results


    if (params[:query]).nil?
      #@record_metadata = RecordMetadatum.limit(5)
    end

    if @record_metadata.empty? || @record_metadata.nil?
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
