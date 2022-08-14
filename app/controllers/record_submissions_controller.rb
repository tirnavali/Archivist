class RecordSubmissionsController < ApplicationController
  def index
    @record_submissions =  authorize RecordSubmission.all
  end

  def index_by_user(user)
    @record_submissions = authorize RecordSubmission.where(user_id = user.id)
  end
end
