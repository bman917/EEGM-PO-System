module ApplicationHelper
   def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      partial = association.to_s.singularize + "_fields"
      partial = 'phones/' + partial if(association == :phones)
      render(partial, f: builder)
    end
    link_to(image_tag("Add.gif"), '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
