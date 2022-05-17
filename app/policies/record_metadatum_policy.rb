class RecordMetadatumPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if (user.superadmin?)
        scope.all
      else
        scope.where(is_secret: false)
      end
    end

    private

    attr_reader :user, :scope
  end

  def show?
    (user.superadmin?) or !record.is_secret?
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

  private 

  def free_to_view?
    !@record.is_secret
  end

end