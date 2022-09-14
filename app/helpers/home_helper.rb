module HomeHelper
  #takes Sunspot::Search::FieldFacet 
  def facet_helper(field_facet, result_size=10, field_facet_params)
    inputs = ""
    unless field_facet.nil? || field_facet.rows.size == 0
      field_facet.rows[1..result_size.to_i].each do |facet|
        input = ERB.new <<-TEMP
          <li>
            <%= check_box_tag "#{field_facet.name}[#{facet.value}]", "#{facet.value}", #{(!field_facet_params.nil?) && (field_facet_params.include?(facet.value))} %>
            <%= label_tag "#{facet.value} #{facet.count}" %>
          </li>
          TEMP
      inputs << input.result(binding).html_safe
      end
    end
    
    template = ERB.new <<-TEMPLATE
      <h3><%= t(field_facet.name) %></h3>
      #{inputs}
      TEMPLATE
      unless field_facet.nil? || field_facet.rows.size == 0
        template.result(binding).html_safe
      end
  end
  
end
