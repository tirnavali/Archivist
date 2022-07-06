class HomePolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end


  def index?
    true
  end

  def show?
    user.admin?
  end

end
  