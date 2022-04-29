class UserPolicy < ApplicationPolicy
 
  def activities?
    (user.has_role? :admin) || (users_record?)
  end

  def show?
    (user.has_role? :admin) || users_record?  
  end

  def index?
    (user.has_role? :admin)
  end
  
  def new?
    user.has_role? :admin
  end

  def edit?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end
  
  def update?
    user.has_role? :admin
  end
  
  def destroy?
    user.has_role? :admin
  end

  private 

    def users_record?
      @user.id == @record.id
    end

end