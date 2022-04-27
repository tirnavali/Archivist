class SpecialNumbersController < ApplicationController
  before_action :set_special_number, only: %i[ show edit update destroy ]

  # GET /special_numbers or /special_numbers.json
  def index
    @special_numbers = SpecialNumber.all
  end

  # GET /special_numbers/1 or /special_numbers/1.json
  def show
  end

  # GET /special_numbers/new
  def new
    @special_number = SpecialNumber.new
    authorize @special_number
  end

  # GET /special_numbers/1/edit
  def edit
    authorize @special_number
  end

  # POST /special_numbers or /special_numbers.json
  def create
    @special_number = SpecialNumber.new(special_number_params)
    authorize @special_number
    respond_to do |format|
      if @special_number.save
        format.html { redirect_to special_number_url(@special_number), notice: "Special number was successfully created." }
        format.json { render :show, status: :created, location: @special_number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @special_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_numbers/1 or /special_numbers/1.json
  def update
    authorize @special_number
    respond_to do |format|
      if @special_number.update(special_number_params)
        format.html { redirect_to special_number_url(@special_number), notice: "Special number was successfully updated." }
        format.json { render :show, status: :ok, location: @special_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @special_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_numbers/1 or /special_numbers/1.json
  def destroy
    authorize @special_number
    @special_number.destroy
    respond_to do |format|
      format.html { redirect_to special_numbers_url, notice: "Special number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_number
      @special_number = SpecialNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def special_number_params
      params.require(:special_number).permit(:name)
    end
end
