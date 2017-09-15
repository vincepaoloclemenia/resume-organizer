module ApplicationHelper

    def flash_class(level)
        case level
            when 'notice' then "alert alert-dismissable alert-info"
            when 'success' then "alert alert-dismissable alert-success"
            when 'error' then "alert alert-dismissable alert-danger"
            when 'alert' then "alert alert-dismissable alert-danger"
        end
    end
    
    def resume_exist? person
        person == params[:id]
        person.present? && !person.nil?
    end

    def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end

end
