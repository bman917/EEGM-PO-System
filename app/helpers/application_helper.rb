module ApplicationHelper
   def po_statuses
      [
        ['PENDING','PENDING'],
        ['CONFIRMED','CONFIRMED'],
        ['DELIVERED','DELIVERED'],
        ['CANCELLED','CANCELLED']
      ]
   end

   def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      partial = association.to_s.singularize + "_fields"
      partial = 'phones/' + partial if(association == :phones)
      render(partial, f: builder)
    end
    link_to(name, '#', id: "add_#{association}", class: "add_fields", tabindex: -1, data: {id: id, fields: fields.gsub("\n", "")})
  end

  def current_version
    '1.1.0'
  end
end
