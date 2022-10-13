module HomeHelper
  #
  # generates active tag with help of given parameters
  # use it in erb views
  #
  def active_accordion(params_hash, param_names=[])
    begin
      result = false
      param_names.map!{|n| n.to_sym }
      param_names.each do |n| 
        if params_hash.fetch(n, {}).is_a? String 
          if !params_hash.fetch(n, {}).empty? 
            result = true
          end 
        end
        if params_hash.fetch(n, {}).is_a? Array
          if params_hash.fetch(n, {}).size > 1 
            result = true 
          end
        end 
      end
      if result
        "active"
      else 
        ""
      end
    rescue 
      ""
    end
  end

  #
  # takes Sunspot::Search::FieldFacet
  #
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
