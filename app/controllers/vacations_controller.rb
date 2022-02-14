class VacationsController < ApplicationController
  before_action :set_vacation, only: %i[ show edit update destroy ]

  # GET /vacations or /vacations.json
  def index
    @vacations = Vacation.all
  end

  # GET /vacations/1 or /vacations/1.json
  def show
    puts "Current user : #{current_user.email}"
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
  end

  # GET /vacations/1/edit
  def edit
  end

  # POST /vacations or /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)
    
    if @vacation.user_id.nil?
      @vacation.user_id = current_user.id
    end

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to vacation_url(@vacation), notice: "Vacation was successfully created." }
        format.json { render :show, status: :created, location: @vacation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacations/1 or /vacations/1.json
  def update
    respond_to do |format|
      if @vacation.update(vacation_params)
        if @vacation.user_id.nil?
          @vacation.user_id = current_user.id
        end
        format.html { redirect_to vacation_url(@vacation), notice: "Vacation was successfully updated." }
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1 or /vacations/1.json
  def destroy
    @vacation.destroy

    respond_to do |format|
      format.html { redirect_to vacations_url, notice: "Vacation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:explanation, :user_id, :starting_date, :ending_date)
    end
end
