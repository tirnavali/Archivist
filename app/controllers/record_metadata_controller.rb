class RecordMetadataController < ApplicationController
  before_action :set_record_metadatum, only: %i[ show edit update destroy audit]
  before_action do
    #ActiveStorage::Current.url_options = {protocol: request.protocol, host: request.host, port: request.port}
  end

  def audit
    authorize @record_metadatum 
    unless @record_metadatum.audits.empty?
      @audits =Audit.sort_model_audits @record_metadatum
    end
  end
  # GET /record_metadata or /record_metadata.json
  def index
    #@record_metadata = RecordMetadatum.all
    
    @q = RecordMetadatum.ransack(params[:q])
    @q.build_grouping.build_condition
    
    @record_metadata = policy_scope(@q.result.page params[:page])
    flash.now[:notice] = "We have exactly #{@q.result.size} record available."
  end

  def search
    index
    render :index, status: :unprocessable_entity
  end
  # GET /record_metadata/1 or /record_metadata/1.json
  def show
    authorize @record_metadatum 
    unless @record_metadatum.record_attachment.nil?
      @image =  @record_metadatum.record_attachment.images.first
    end
    #@image = @image.representation("quality": 10).processed.download
  end

  # GET /record_metadata/new
  def new
    @record_metadatum = RecordMetadatum.new
    authorize @record_metadatum 
    @record_metadatum.special_numbers.build
  end

  # GET /record_metadata/1/edit
  def edit
    authorize @record_metadatum
  end

  # POST /record_metadata or /record_metadata.json
  def create
    Current.user = current_user
    @record_metadatum = RecordMetadatum.new(record_metadatum_params)
    authorize @record_metadatum 
    respond_to do |format|
      if @record_metadatum.save
        format.html { redirect_to new_record_attachment_url(record_metadatum_id: @record_metadatum.id), notice: "Record metadatum was successfully created." }
        format.json { render :show, status: :created, location: @record_metadatum }
      else
        @record_metadatum.special_numbers.build
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record_metadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_metadata/1 or /record_metadata/1.json
  def update
    respond_to do |format|
      if @record_metadatum.update(record_metadatum_params)
        if @record_metadatum.record_attachment 
          format.html { redirect_to edit_record_attachment_path(@record_metadatum.record_attachment), notice: "Record metadatum was successfully updated." }
        else
          format.html { redirect_to new_record_attachment_url(record_metadatum_id: @record_metadatum.id), notice: "Record metadatum was successfully updated." }
        end
        format.json { render :show, status: :ok, location: @record_metadatum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record_metadatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_metadata/1 or /record_metadata/1.json
  def destroy
    authorize @record_metadatum
    @record_metadatum.destroy

    respond_to do |format|
      format.html { redirect_to record_metadata_url, notice: "Record metadatum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_metadatum
      @record_metadatum = RecordMetadatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_metadatum_params
      params.require(:record_metadatum).permit(
        :fond_id, 
        :organization_code, 
        :box, 
        :order,
        :folder, 
        :summary, 
        :starting_date, 
        :ending_date, 
        :privacy_id,
        :phisycal_status_id,
        :explaination,
        :is_secret,  
        organization_ids:[],       
        subject_ids:[], 
        language_ids:[], 
        person_ids:[], 
        toponym_ids:[],
        document_type_ids:[],
        special_numbers_attributes: [
          :id,
          :number_type_id,
          :value,
          :_destroy,
          :record_metadatum_id,       
         ])
    end
end
