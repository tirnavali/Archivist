class SubjectPolicy < ApplicationPolicy
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
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
