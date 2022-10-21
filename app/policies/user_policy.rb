class UserPolicy < ApplicationPolicy
  def users_collections?
    user.superadmin? || user.admin? || users_record? 
  end

  def record_submissions?
    user.superadmin? || user.admin? || (users_record? && !user.user?)
  end
 
  def activities?
    user.superadmin? || user.admin? || (users_record? && !user.user?) 
  end

  def show?
    user.superadmin? || user.admin? || users_record? 
  end

  def index?
    user.superadmin? || user.admin?
  end
  
  def new?
    user.superadmin?|| user.admin?
  end

  def edit?
    user.superadmin?|| user.admin?
  end

  def create?
    user.superadmin?|| user.admin?
  end
  
  def update?
    user.superadmin?|| user.admin?
  end
  
  def destroy?
    user.superadmin?
  end

  private 
    def users_record?
      @user.id == @record.id
    end
end