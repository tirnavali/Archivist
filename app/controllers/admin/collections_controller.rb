class Admin::CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show edit update destroy ]

  # GET /admin/collections or /admin/collections.json
  def index
    @collections = policy_scope(Collection)
  end

  # GET /admin/collections/1 or /admin/collections/1.json
  def show
  end

  # GET /admin/collections/new
  def new
    @collection = Collection.new
  end

  # GET /admin/collections/1/edit
  def edit
  end

  # POST /admin/collections or /admin/collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to admin_collection_url(@collection), notice: "Collection was successfully created." }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/collections/1 or /admin/collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to admin_collection_url(@collection), notice: "Collection was successfully updated." }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/collections/1 or /admin/collections/1.json
  def destroy
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to admin_collections_url, notice: "Collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:title, :user_id)
    end
end
