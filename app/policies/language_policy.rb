class LanguagePolicy < ApplicationPolicy
  def show?
    user.superadmin? || user.admin? || user.editor?
  end
  
  def new?
    user.superadmin? || user.admin? || user.editor?
  end

  def create?
    user.superadmin? || user.admin? || user.editor?
  end

  def edit?
    user.superadmin? || user.admin?
  end
  
  def update?
    user.superadmin? || user.admin?
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
