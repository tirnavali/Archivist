class AdminSearchPolicy
  attr_reader :user

  # _record in this example will just be :dashboard
  def initialize(user, _record)
    @user = user
  end

  def show?
    user.superadmin? || user.admin? || user.editor?
  end
end