class CollectionPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      @scope.where(user: @user)
    end

    private

    attr_reader :user, :scope
  end

end