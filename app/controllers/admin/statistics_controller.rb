class Admin::StatisticsController < ApplicationController
  def entities
    @users = User.all
    @record_metadata = RecordMetadatum.all
    @fonds = Fond.all
    @people = Person.all
    @toponyms = Toponym.all
    @organizations = Organization.all
    @subjects = Subject.all
    @privacies = Privacy.all
    @languages = Language.all
    @phisycal_statuses = PhisycalStatus.all
    @document_types = DocumentType.all
    @special_numbers = SpecialNumber.all
    @num_types = NumberType.all
  end

  def index
  end


end
