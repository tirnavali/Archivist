class VacationsController < ApplicationController 
  before_action :authenticate_user! #, except: %i[ show index]
  before_action :set_vacation, only: %i[ show edit update destroy ]
  

  # GET /vacations or /vacations.json
  def index
    @vacations = Vacation.order(:starting_date)
    authorize @vacations
    #Eğer super admin ise tüm vacation listesini görsün
    # if current_user && current_user.superadmin?
    #   @vacations = Vacation.order(:starting_date)
    # elsif current_user
    #   @vacations = Vacation.user_vacations(current_user)
    # else
    #   @vacations = Vacation.order(:starting_date)
    # end

  end

  # GET /vacations/1 or /vacations/1.json
  def show    
    authorize @vacation
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
    authorize @vacation
  end

  # GET /vacations/1/edit
  def edit
    authorize @vacation
  end

  # POST /vacations or /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)
    authorize @vacation
    
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
    authorize @vacation
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
    authorize @vacation
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

    def set_vacation_related_current_user
      @vacation = Vacation.find(params[:id])
      #@vacation = Vacation.where('id == ? ', params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:explanation, :user_id, :starting_date, :ending_date)
    end
end
