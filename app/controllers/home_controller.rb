class HomeController < ApplicationController
  def index

    search_param = params[:src]
    #@user = User.new
    #console
    @search = RecordMetadatum.search do 
      fulltext search_param[:query] if search_param.try(:[], :query)
      with :fond_scope_id, search_param[:fond_scope_id] if search_param.try(:[], :fond_scope_id).present?
      
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

      #with(:starting_date).between(params[:src][:starting_date_from]..params[:src][:starting_date_to]) if params.fetch(:src, {} ).fetch(:starting_date_from, nil) && params.fetch(:src, {} ).fetch(:starting_date_to, nil)
      if (search_param.try(:[], :starting_date_from).present? && search_param.try(:[], :starting_date_to).present?) == true
        with(:starting_date).between(search_param[:starting_date_from]..search_param[:starting_date_to])
      end
      
      if (search_param.try(:[], :ending_date_from).present? && search_param.try(:[], :ending_date_to).present?) == true
        with(:ending_date).between(search_param[:ending_date_from]..search_param[:ending_date_to]) 
      end

      if (search_param.try(:[], :created_at_from).present? && search_param.try(:[], :created_at_to).present?) == true
        with(:created_at).between("2022-10-25".."2022-10-26") 
      end
      #with(:ending_date).between(params[:src][:ending_date_from]..params[:src][:ending_date_to]) if params.fetch(:src, {} ).fetch(:ending_date_from, false) && params.fetch(:src, {} ).fetch(:ending_date_to, false)
      #with(:created_at).between(search_param[:created_at_from]..search_param[:created_at_to]) if search_param.try(:[], :created_at_from).present? && search_param.try(:[], :created_at_to).present?
      with(:updated_at).between(search_param[:updated_at_from]..search_param[:updated_at_to]) if search_param.try(:[], :updated_at_from).present? && search_param.try(:[], :updated_at_to).present?

      with :document_type_ids, search_param[:document_type_ids].filter_map {|val| val.to_i if val.length > 0  } if search_param.try(:[], :document_type_ids).present?
      with :privacy_id, search_param[:privacy_id] if search_param.try(:[], :privacy_id).present?
      with :phisycal_status_id, search_param[:phisycal_status_id] if search_param.try(:[], :phisycal_status_id).present?
      with :language_ids, search_param[:language_ids].filter_map {|val| val.to_i if val.length > 0 } if search_param.try(:[], :language_ids).present?
      
      with :organization_code, search_param[:organization_code].upcase(:turkic) if search_param.try(:[], :organization_code).present?
    
      with :box, search_param[:box] if search_param.try(:[], :box).present?
      with :folder, search_param[:folder] if search_param.try(:[], :folder).present?
      with :order, search_param[:order] if search_param.try(:[], :order).present?
      #
      # NumberTypes
      #
      
      if search_param.present? &&  search_param[:number_type].empty? && search_param[:number_value].present?
        with :special_code, (search_param[:number_value])
      elsif search_param.present? && search_param[:number_type].present? && search_param[:number_value].empty?
        #
      elsif search_param.present? && search_param[:number_type].present? && search_param[:number_value].present?
        all_of do
          with(:special_code).equal_to(search_param[:number_value])
          with(:special_number_type).equal_to(search_param[:number_type])
        end
      end

      #
      # IsSecret
      #
      if search_param.try(:[],:show_sec).present? && search_param.try(:[],:show_not_sec).present?
        with :is_secret
      elsif search_param.try(:[],:show_sec).present?
        with :is_secret, search_param[:show_sec] 
      elsif search_param.try(:[],:show_not_sec).present?
        with :is_secret, false if search_param[:show_not_sec] == "false"
      end

      paginate page: params[:page], per_page: 10
    end
    
    @subjects_facet = @search.facet(:subject_ids)
    @toponyms_facet = @search.facet(:toponym_ids)
    @organizations_facet = @search.facet(:organization_ids)
    @person_facet = @search.facet(:person_ids)
    @fonds = @search.facet(:fond)

    @record_metadata = @search.results

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
