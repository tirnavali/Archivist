class RecordMetadataController < ApplicationController
  before_action :set_record_metadatum, only: %i[ show edit update destroy ]

  # GET /record_metadata or /record_metadata.json
  def index
    @record_metadata = RecordMetadatum.all
  end

  # GET /record_metadata/1 or /record_metadata/1.json
  def show
  end

  # GET /record_metadata/new
  def new
    @record_metadatum = RecordMetadatum.new
  end

  # GET /record_metadata/1/edit
  def edit
  end

  # POST /record_metadata or /record_metadata.json
  def create
    @record_metadatum = RecordMetadatum.new(record_metadatum_params)

    respond_to do |format|
      if @record_metadatum.save
        format.html { redirect_to new_record_attachment_url(record_metadatum_id: @record_metadatum.id), notice: "Record metadatum was successfully created." }
        format.json { render :show, status: :created, location: @record_metadatum }
      else
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
      params.require(:record_metadatum).permit(:summary)
    end
end