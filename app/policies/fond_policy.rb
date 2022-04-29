class FondPolicy < ApplicationPolicy
  def index?
    true
  end  

  def show?
    true
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

  def audit?
    user.has_role? :admin
  end
end