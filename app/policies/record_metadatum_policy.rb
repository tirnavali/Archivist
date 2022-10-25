class RecordMetadatumPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if (user.superadmin?|| user.admin? || user.editor? || user.writer? )
        scope.all
      else
        scope.where(is_secret: false)
      end
    end

    private

    attr_reader :user, :scope
  end

  def search?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end

  def index?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end

  def show?
    (user.superadmin?) or !record.is_secret?
  end

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
    user.superadmin? || user.admin? 
  end

  def audit?
    user.superadmin? || user.admin? || user.editor? || user.writer?
  end

  private 

  def free_to_view?
    !@record.is_secret
  end

end