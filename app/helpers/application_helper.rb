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
        person.present?
    end

end
