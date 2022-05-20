class PersonPolicy < ApplicationPolicy
  def new?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end
  
  def create?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end
  
  def edit?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end

  def update?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end
  
  def destroy?
    user.superadmin? || user.admin? || user.editor?
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
