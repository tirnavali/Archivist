class UserPolicy < ApplicationPolicy
 
  def activities?
    user.superadmin? || users_record?
  end

  def show?
    user.superadmin? || user.admin? || users_record? 
  end

  def index?
    user.superadmin? || user.admin?
  end
  
  def new?
    user.superadmin?
  end

  def edit?
    user.superadmin?
  end

  def create?
    user.superadmin?
  end
  
  def update?
    user.superadmin?
  end
  
  def destroy?
    user.superadmin?
  end

  private 
    def users_record?
      @user.id == @record.id
    end
end