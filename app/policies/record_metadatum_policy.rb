class RecordMetadatumPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if (user.has_role? :admin)
        scope.all
      else
        scope.where(is_secret: false)
      end
    end

    private

    attr_reader :user, :scope
  end

  def show?
    (user.has_role? :admin) or !record.is_secret?
  end

  def new?
    user.has_role? :admin
  end

  def edit?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end
  
  def update?
    user.has_role? :admin
  end
  
  def destroy?
    user.has_role? :admin
  end

  def audit?
    user.has_role? :admin
  end

  private 

  def free_to_view?
    !@record.is_secret
  end

end