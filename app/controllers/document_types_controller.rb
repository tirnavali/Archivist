class DocumentTypesController < ApplicationController
  before_action :set_document_type, only: %i[ show edit update destroy ]

  # GET /document_types or /document_types.json
  def index
    @document_types = DocumentType.order(:name).page params[:page]
  end

  # GET /document_types/1 or /document_types/1.json
  def show
  end

  # GET /document_types/new
  def new
    @document_type = DocumentType.new
    authorize @document_type
  end

  # GET /document_types/1/edit
  def edit
    authorize @document_type
  end

  # POST /document_types or /document_types.json
  def create
    @document_type = DocumentType.new(document_type_params)
    authorize @document_type
    respond_to do |format|
      if @document_type.save
        format.html { redirect_to document_type_url(@document_type), notice: "Document type was successfully created." }
        format.json { render :show, status: :created, location: @document_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_types/1 or /document_types/1.json
  def update
    authorize @document_type
    respond_to do |format|
      if @document_type.update(document_type_params)
        format.html { redirect_to document_type_url(@document_type), notice: "Document type was successfully updated." }
        format.json { render :show, status: :ok, location: @document_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_types/1 or /document_types/1.json
  def destroy
    authorize @document_type
    @document_type.destroy

    respond_to do |format|
      format.html { redirect_to document_types_url, notice: "Document type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_type
      @document_type = DocumentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_type_params
      params.require(:document_type).permit(:name)
    end
end
