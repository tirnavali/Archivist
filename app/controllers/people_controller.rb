class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  skip_before_action  :authenticate_user!, only: %i[search]

  # GET http://localhost:3000/people/search.json?
  def search
    @people = Person.where("name like ?", "%#{params[:term]}%")
    #puts "search size #{@people.size}"
   end

   # GET /people or /people.json
  def index
    #@people = Person.order(:name).page params[:page]
    @q = Person.ransack(params[:q])
    @people = @q.result.page params[:page]
    authorize @people
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    authorize @person
  end

  # GET /people/1/edit
  def edit
    authorize @person
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    authorize @person
    respond_to do |format|
      if @person.save
        flash[:info] = "Person was successfully created."
        format.turbo_stream
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    authorize @person
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    authorize @person
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
      authorize @person
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name)
    end
end
