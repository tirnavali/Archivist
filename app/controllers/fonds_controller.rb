class FondsController < ApplicationController
  include Administration
  before_action :set_fond, only: %i[ show edit update destroy ]
  #before_action :require_admin, only: %i[edit update destroy ]

  # GET /fonds or /fonds.json
  def index
    if params[:only_ancestors] == '1'
      @q = Fond.ransack(params[:q] = {"depth_eq": 0} )
      @fonds = @q.result.page params[:page]
    else
      @q = Fond.ransack(params[:q])
      @fonds = @q.result.page params[:page]
    end

    authorize @fonds
  end
  # GET /fonds/1 or /fonds/1.json
  def show
    authorize @fond
    @q = RecordMetadatum.ransack(params[:q])
    @record_metadata = @q.result.page params[:page]
  end

  # GET /fonds/new
  def new
    @fond = Fond.new
    authorize @fond
  end

  # GET /fonds/1/edit
  def edit
    authorize @fond
  end

  # POST /fonds or /fonds.json
  def create
    @fond = Fond.new(fond_params)
    authorize @fond
    respond_to do |format|
      if @fond.save
        format.html { redirect_to fond_url(@fond), notice: t(:created_successfully)}
        format.json { render :show, status: :created, location: @fond }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fonds/1 or /fonds/1.json
  def update
    authorize @fond
    respond_to do |format|
      if @fond.update(fond_params)
        format.html { redirect_to fond_url(@fond), notice: t(:updated_successfully) }
        format.json { render :show, status: :ok, location: @fond }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonds/1 or /fonds/1.json
  def destroy
    authorize @fond
    @fond.destroy

    respond_to do |format|
      format.html { redirect_to fonds_url, notice: t(:destroyed_successfully) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fond
      @fond = Fond.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fond_params
      params.require(:fond).permit(:name, :parent_id, :explanation)
    end
end
