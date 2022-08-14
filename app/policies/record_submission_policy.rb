class RecordSubmissionPolicy < ApplicationPolicy
  def index?
    user.superadmin? || user.admin?
  end

  def record_submissions?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end
  
end