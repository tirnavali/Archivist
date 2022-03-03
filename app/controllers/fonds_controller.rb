class FondsController < ApplicationController
  include Administration
  before_action :set_fond, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[edit update destroy ]

  # GET /fonds or /fonds.json
  def index
    @fonds = Fond.all
  end

  # GET /fonds/1 or /fonds/1.json
  def show
  end

  # GET /fonds/new
  def new
    @fond = Fond.new
  end

  # GET /fonds/1/edit
  def edit
  end

  # POST /fonds or /fonds.json
  def create
    @fond = Fond.new(fond_params)

    respond_to do |format|
      if @fond.save
        format.html { redirect_to fond_url(@fond), notice: "Fond was successfully created." }
        format.json { render :show, status: :created, location: @fond }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fonds/1 or /fonds/1.json
  def update
    respond_to do |format|
      if @fond.update(fond_params)
        format.html { redirect_to fond_url(@fond), notice: "Fond was successfully updated." }
        format.json { render :show, status: :ok, location: @fond }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonds/1 or /fonds/1.json
  def destroy
    @fond.destroy

    respond_to do |format|
      format.html { redirect_to fonds_url, notice: "Fond was successfully destroyed." }
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
