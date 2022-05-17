class FondPolicy < ApplicationPolicy
  def index?
    true
  end  

  def show?
    true
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

  def audit?
    user.superadmin?
  end
end