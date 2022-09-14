module HomeHelper
  #takes Sunspot::Search::FieldFacet 
  def facet_helper(field_facet, result_size=10, field_facet_params)
    inputs = ""
    
    field_facet.rows[1..result_size.to_i].each do |facet|
      input = ERB.new <<-TEMP
        <li>
          <%= check_box_tag "#{field_facet.name}[#{facet.value}]", "#{facet.value}", #{(!field_facet_params.nil?) && (field_facet_params.include?(facet.value))} %>
          <%= label_tag "#{facet.value} #{facet.count}" %>
        </li>
        TEMP
    inputs << input.result(binding).html_safe
    end
    
    template = ERB.new <<-TEMPLATE
      <h3><%= t(field_facet.name) %></h3>
      #{inputs}
      TEMPLATE
      unless field_facet.nil? || field_facet.rows.size == 0
        template.result(binding).html_safe
      end
  end

  def facet_helper2(field_facet)
    template = ERB.new <<-TEMPLATE
    <% unless field_facet.nil? || field_facet.rows.size == 0 %>
        <div class="row">
          <h3><%= t(:toponyms) %></h3>
          <% field_facet.rows[1..10].each do |facet| %>
            <li>
              <%= check_box_tag "toponyms[]", facet.value, ((!params[:toponyms].nil?) && (params[:toponyms].include? facet.value)) %>
              <%= label_tag "" %>
            </li>
          <% end %> 
        </div>
      <% end %>
      TEMPLATE
    template.result(binding).html_safe
  end
end
