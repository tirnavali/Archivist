class VacationPolicy < ApplicationPolicy
  def show?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end

  def index?
    user.superadmin? || user.admin?
  end
  
  def new?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end

  def edit?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end

  def create?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end
  
  def update?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end
  
  def destroy?
    user.superadmin? || user.admin? || user.editor? ||user.writer?
  end
end