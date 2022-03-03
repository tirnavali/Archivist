class PhisycalStatusesController < ApplicationController
  before_action :set_phisycal_status, only: %i[ show edit update destroy ]

  # GET /phisycal_statuses or /phisycal_statuses.json
  def index
    @phisycal_statuses = PhisycalStatus.order(:name).page params[:page]
  end

  # GET /phisycal_statuses/1 or /phisycal_statuses/1.json
  def show
  end

  # GET /phisycal_statuses/new
  def new
    @phisycal_status = PhisycalStatus.new
  end

  # GET /phisycal_statuses/1/edit
  def edit
  end

  # POST /phisycal_statuses or /phisycal_statuses.json
  def create
    @phisycal_status = PhisycalStatus.new(phisycal_status_params)

    respond_to do |format|
      if @phisycal_status.save
        format.html { redirect_to phisycal_status_url(@phisycal_status), notice: "Phisycal status was successfully created." }
        format.json { render :show, status: :created, location: @phisycal_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phisycal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phisycal_statuses/1 or /phisycal_statuses/1.json
  def update
    respond_to do |format|
      if @phisycal_status.update(phisycal_status_params)
        format.html { redirect_to phisycal_status_url(@phisycal_status), notice: "Phisycal status was successfully updated." }
        format.json { render :show, status: :ok, location: @phisycal_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phisycal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phisycal_statuses/1 or /phisycal_statuses/1.json
  def destroy
    @phisycal_status.destroy

    respond_to do |format|
      format.html { redirect_to phisycal_statuses_url, notice: "Phisycal status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phisycal_status
      @phisycal_status = PhisycalStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phisycal_status_params
      params.require(:phisycal_status).permit(:name)
    end
end
