class UserPolicy < ApplicationPolicy
 
  def activities?
    (user.has_role? :admin) || (users_record?)
  end

  def show?
    (user.has_role? :admin) || users_record?  
  end

  def index?
    user.superadmin?
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