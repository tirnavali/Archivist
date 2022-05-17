class VacationPolicy < ApplicationPolicy
  def show?
    user.superadmin?
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
end