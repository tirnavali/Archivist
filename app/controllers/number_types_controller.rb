class NumberTypesController < ApplicationController
  before_action :set_number_type, only: %i[ show edit update destroy ]

  # GET /number_types or /number_types.json
  def index
    @number_types = NumberType.all
  end

  # GET /number_types/1 or /number_types/1.json
  def show
  end

  # GET /number_types/new
  def new
    @number_type = NumberType.new
    authorize @number_type
  end

  # GET /number_types/1/edit
  def edit
    authorize @number_type
  end

  # POST /number_types or /number_types.json
  def create
    @number_type = NumberType.new(number_type_params)
    authorize @number_type
    respond_to do |format|
      if @number_type.save
        format.html { redirect_to number_type_url(@number_type), notice: "Number type was successfully created." }
        format.json { render :show, status: :created, location: @number_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @number_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_types/1 or /number_types/1.json
  def update
    authorize @number_type
    respond_to do |format|
      if @number_type.update(number_type_params)
        format.html { redirect_to number_type_url(@number_type), notice: "Number type was successfully updated." }
        format.json { render :show, status: :ok, location: @number_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @number_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_types/1 or /number_types/1.json
  def destroy
    authorize @number_type
    @number_type.destroy

    respond_to do |format|
      format.html { redirect_to number_types_url, notice: "Number type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_type
      @number_type = NumberType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_type_params
      params.require(:number_type).permit(:name)
    end
end
