class NumberTypePolicy < ApplicationPolicy
  def new?
    user.superadmin? || user.admin? || user.editor?
  end

  def create?
    user.superadmin? || user.admin? || user.editor?
  end

  def edit?
    user.superadmin? || user.admin? || user.editor?
  end

  def update?
    user.superadmin? || user.admin? || user.editor?
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
