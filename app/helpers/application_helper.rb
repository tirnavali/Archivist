module ApplicationHelper
  def is_page_active?(current_page_path)
    if current_page?(current_page_path)
      "active teal item"
    else 
      "teal item"
    end
  end

  def user_superadmin?
    current_user.superadmin?
  end

  def record_navigation(attachment_id: 0, metadatum_id: 0)
    render "layouts/shared/record_nav", {record_attachment_id: attachment_id, record_metadatum_id: metadatum_id }
  end
end
