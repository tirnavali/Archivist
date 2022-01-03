class PrivaciesController < ApplicationController
  before_action :set_privacy, only: %i[ show edit update destroy ]

  # GET /privacies or /privacies.json
  def index
    @privacies = Privacy.all
  end

  # GET /privacies/1 or /privacies/1.json
  def show
  end

  # GET /privacies/new
  def new
    @privacy = Privacy.new
  end

  # GET /privacies/1/edit
  def edit
  end

  # POST /privacies or /privacies.json
  def create
    @privacy = Privacy.new(privacy_params)

    respond_to do |format|
      if @privacy.save
        format.html { redirect_to privacy_url(@privacy), notice: "Privacy was successfully created." }
        format.json { render :show, status: :created, location: @privacy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @privacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privacies/1 or /privacies/1.json
  def update
    respond_to do |format|
      if @privacy.update(privacy_params)
        format.html { redirect_to privacy_url(@privacy), notice: "Privacy was successfully updated." }
        format.json { render :show, status: :ok, location: @privacy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @privacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privacies/1 or /privacies/1.json
  def destroy
    @privacy.destroy

    respond_to do |format|
      format.html { redirect_to privacies_url, notice: "Privacy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privacy
      @privacy = Privacy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privacy_params
      params.require(:privacy).permit(:name)
    end
end
