class HomeControllerPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin?
  end
end
  