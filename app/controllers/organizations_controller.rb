class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]
  skip_before_action  :authenticate_user!, only: %i[index]

  # GET /organizations or /organizations.json
  def index
    @q = Organization.ransack(params[:term])
    @organizations = @q.result.page params[:page]
    authorize @organizations
  end

  # GET /organizations/1 or /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    authorize @organization
  end

  # GET /organizations/1/edit
  def edit
    authorize @organization
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    respond_to do |format|
      if @organization.save
        flash[:info] = "Organization was successfully created."
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    authorize @organization
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    authorize @organization
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
      authorize @organization
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
