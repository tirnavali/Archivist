class LanguagesController < ApplicationController
  before_action :set_language, only: %i[ show edit update destroy ]

  def index 
    @languages = Language.order(:name).page params[:page]
  end

  def show
  end
  
  def new
    @language = Language.new
    authorize @language
  end

  def edit
  end

  def create
    @language = Language.new(language_params)
    authorize @language
    respond_to do |format|
      if @language.save
        flash[:info] = "Language was successfully created."
        format.html { redirect_to language_url(@language), notice: "Language was successfully created." }
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to language_url(@language), notice: "Language was successfully updated." }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: "Language was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_language
    @language = Language.find(params[:id])
    authorize @language
  end

  def language_params
    params.require(:language).permit(:name)
  end
end