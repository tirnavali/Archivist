module ApplicationHelper
  include Pagy::Frontend

  
  def is_page_active?(current_page_path)
    if current_page?(current_page_path)
      "active  item"
    else 
      " item"
    end
  end

  def is_filter_active?(current_page_path)
    if current_page?(current_page_path)
      "ui blue label"
    else 
      "ui basic blue label"
    end
  end

  def user_superadmin?
    current_user.superadmin?
  end

  def record_navigation(attachment_id: 0, metadatum_id: 0)
    render "layouts/shared/record_nav", {record_attachment_id: attachment_id, record_metadatum_id: metadatum_id }
  end

  def titleize_turkish(word)
    word_list = word.split(" ")
    word_list.map!{|word| word[0].upcase(:turkic) + word[1..] }
    word_list.join(" ")
  end
end
