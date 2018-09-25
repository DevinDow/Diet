class ArrayInput < SimpleForm::Inputs::StringInput

  def input(wrapper_option)
    input_html_options[:type] ||= input_type

    # build array of <input> tags for the array
    input_tags = Array(object.public_send(attribute_name)).map do |array_elment|
      # build each <input> tag for each array element 
      @builder.text_field(nil, 
                          input_html_options.merge(value: array_elment,
                                                   name: "#{object_name}[#{attribute_name}][]",
                                                   step: 0.5,
                                                   style: "width: 50px"))  # this makes the <input style="width:50px">
    end

    # enclose each <input> tag in a table cell <td> </td>
    input_tags.map do |input_tag|
      "<td>" + input_tag + "</td>"
    end.join.html_safe  # join the html of the map of <td><input></td>
  end

  def input_type
    :number  # this will provide the up/down buttons
  end

end
