class ToponymsController < ApplicationController
  before_action :set_toponym, only: %i[ show edit update destroy ]
  skip_before_action  :authenticate_user!, only: %i[index]

  # GET /toponyms or /toponyms.json
  def index
    @q = Toponym.ransack(params[:term])
    @q.sorts= 'created_at desc' if @q.sorts.empty?
    @toponyms = @q.result.page params[:page]
    authorize @toponyms
  end

  # GET /toponyms/1 or /toponyms/1.json
  def show
  end

  # GET /toponyms/new
  def new
    @toponym = Toponym.new
    authorize @toponym
  end

  # GET /toponyms/1/edit
  def edit
    authorize @toponym
  end

  # POST /toponyms or /toponyms.json
  def create
    @toponym = Toponym.new(toponym_params)
    authorize @toponym
    respond_to do |format|
      if @toponym.save
        flash[:info] = "Toponym was successfully created."
        format.turbo_stream
        format.html { redirect_to toponym_url(@toponym), notice: "Toponym was successfully created." }
        format.json { render :show, status: :created, location: @toponym }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toponym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toponyms/1 or /toponyms/1.json
  def update
    authorize @toponym
    respond_to do |format|
      if @toponym.update(toponym_params)
        format.html { redirect_to toponym_url(@toponym), notice: "Toponym was successfully updated." }
        format.json { render :show, status: :ok, location: @toponym }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toponym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toponyms/1 or /toponyms/1.json
  def destroy
    authorize @toponym
    @toponym.destroy
    respond_to do |format|
      format.html { redirect_to toponyms_url, notice: "Toponym was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toponym
      @toponym = Toponym.find(params[:id])
      authorize @toponym
    end

    # Only allow a list of trusted parameters through.
    def toponym_params
      params.require(:toponym).permit(:name)
    end
end
