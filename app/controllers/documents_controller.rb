class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy]

  def delete_image_attachment
    puts params[:id]
    @image = ActiveStorage::Attachment.find(params[:id])
    @document = Document.find(@image.record_id)
    @image.purge
    redirect_back fallback_location: @document
    
  end
  # GET /documents or /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1 or /documents/1.json
  def show        
  end

  # GET /documents/new
  def new
    @document = Document.new
    @document.special_numbers.build
    @document.fond_id = params[:fond_id] if params[:fond_id]
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to document_url(@document), notice: "Document was successfully created." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to document_url(@document), notice: "Document was successfully updated." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:organization_code, :box, :order,:folder, :summary, :page_count, :starting_date, :ending_date,
         :pub_type_id, 
         :explaination,         
         :organization_id, 
         :phisycal_status_id,
         :fond_id, 
         person_ids:[], 
         subject_ids:[], 
         language_ids:[], 
         document_type_ids:[],
         toponym_ids:[],
         privacy_ids:[],
         images: [],
         special_numbers_attributes: [
           :id,
           :number_type_id,
           :value,
           :_destroy,
           :document_id,       
         ]  )
    end
end
