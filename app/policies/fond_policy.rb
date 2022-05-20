class FondPolicy < ApplicationPolicy
  def index?
    true
  end  

  def show?
    true
  end

  def new?
    user.superadmin? || user.admin?
  end

  def edit?
    user.superadmin? || user.admin?
  end

  def create?
    user.superadmin? || user.admin?
  end
  
  def update?
    user.superadmin? || user.admin?
  end
  
  def destroy?
    user.superadmin? || user.admin?
  end

  def audit?
    user.superadmin? || user.admin?
  end
end