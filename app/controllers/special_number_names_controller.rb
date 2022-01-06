class SpecialNumberNamesController < ApplicationController
  before_action :set_special_number_name, only: %i[ show edit update destroy ]

  # GET /special_number_names or /special_number_names.json
  def index
    @special_number_names = SpecialNumberName.all
  end

  # GET /special_number_names/1 or /special_number_names/1.json
  def show
  end

  # GET /special_number_names/new
  def new
    @special_number_name = SpecialNumberName.new
  end

  # GET /special_number_names/1/edit
  def edit
  end

  # POST /special_number_names or /special_number_names.json
  def create
    @special_number_name = SpecialNumberName.new(special_number_name_params)

    respond_to do |format|
      if @special_number_name.save
        format.html { redirect_to special_number_name_url(@special_number_name), notice: "Special number name was successfully created." }
        format.json { render :show, status: :created, location: @special_number_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @special_number_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_number_names/1 or /special_number_names/1.json
  def update
    respond_to do |format|
      if @special_number_name.update(special_number_name_params)
        format.html { redirect_to special_number_name_url(@special_number_name), notice: "Special number name was successfully updated." }
        format.json { render :show, status: :ok, location: @special_number_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @special_number_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_number_names/1 or /special_number_names/1.json
  def destroy
    @special_number_name.destroy

    respond_to do |format|
      format.html { redirect_to special_number_names_url, notice: "Special number name was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_number_name
      @special_number_name = SpecialNumberName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def special_number_name_params
      params.require(:special_number_name).permit(:name)
    end
end
