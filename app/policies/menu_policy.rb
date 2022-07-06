class MenuPolicy
  attr_reader :user

  # _record in this example will just be :dashboard
  def initialize(user, _record)
    #raise Pundit::NotAuthorizedError, "You must be logged in" unless user

    @user = user
    @record = _record
  end

  def show?
    user.superadmin? || user.admin? || user.editor?
  end

end