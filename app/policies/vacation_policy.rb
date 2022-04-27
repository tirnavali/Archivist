class VacationPolicy < ApplicationPolicy
  def show?
    user.admin? || user.superadmin?
  end

  def index?
    user.admin?
  end
  
  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def create?
    user.admin?
  end
  
  def update?
    user.admin?
  end
  
  def destroy?
    user.admin?
  end
end