class RecordSubmissionsController < ApplicationController
  def index
    @record_submissions = RecordSubmission.all
  end

  def index_by_user(user)
    @record_submissions = RecordSubmission.where(user_id = user.id)
  end
end
