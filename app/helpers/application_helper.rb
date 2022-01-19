module ApplicationHelper
    def is_page_active?(current_page_path)
        if current_page?(current_page_path)
            "active teal item"
        else 
            "teal item"
        end
    end

end
