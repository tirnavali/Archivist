module Administration
  extend ActiveSupport::Concern
  def require_admin
    unless current_user && current_user.superadmin?
      redirect_to root_path, alert: "You are not authorized to do that action" 
    end
  end
end