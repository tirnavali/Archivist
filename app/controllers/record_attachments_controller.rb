class RecordAttachmentsController < ApplicationController
  before_action :set_record_attachment, only: %i[ show edit update destroy ]

  def delete_image_attachment
    puts params[:id]
    @image = ActiveStorage::Attachment.find(params[:id])
    @record_attachment = RecordAttachment.find(@image.record_id)
    authorize @record_attachment
    begin
      @image.purge
      redirect_back fallback_location: @record_attachment, notice: "Record attachment was successfully deleted."
    rescue Seahorse::Client::NetworkingError
      redirect_back fallback_location: @record_attachment, notice: "Record attachment was successfully deleted."
    end
    
  end

  # GET /record_attachments or /record_attachments.json
  def index
    @record_attachments = RecordAttachment.all
  end

  # GET /record_attachments/1 or /record_attachments/1.json
  def show
  end

  # GET /record_attachments/new
  def new
    @record_attachment = RecordAttachment.new
    authorize @record_attachment
    metadatum = RecordMetadatum.find(params[:record_metadatum_id])
    @record_attachment.record_metadatum= metadatum
  
  end

  # GET /record_attachments/1/edit
  def edit
    authorize @record_attachment
  end

  # POST /record_attachments or /record_attachments.json
  def create
    @record_attachment = RecordAttachment.new(record_attachment_params)
    #authorize @record_attachment
    respond_to do |format|
      if @record_attachment.save
        format.html { redirect_to record_metadatum_url(@record_attachment.record_metadatum), notice: "Record attachment was successfully created." }
        format.json { render :show, status: :created, location: @record_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_attachments/1 or /record_attachments/1.json
  def update
    authorize @record_attachment
    respond_to do |format|
      if @record_attachment.update(record_attachment_params)
        format.html { redirect_to record_metadatum_url(@record_attachment.record_metadatum), notice: "Record attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @record_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_attachments/1 or /record_attachments/1.json
  def destroy
    authorize @record_attachment
    @record_attachment.destroy

    respond_to do |format|
      format.html { redirect_to record_attachments_url, notice: "Record attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_attachment
      @record_attachment = RecordAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_attachment_params
      params.require(:record_attachment).permit(:completed, :record_metadatum_id, images: [])
    end
end
