class ObjectivesController < ApplicationController
    before_action :find_person
    

    private

        def find_person
            @person = Person.find_by_id(params[:person_id])
            if @person.nil?
                redirect_to root_path 
                flash[:alert] = "No Resume found to continue"
            end
        end
end