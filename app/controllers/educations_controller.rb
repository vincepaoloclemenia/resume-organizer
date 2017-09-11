class EducationsController < ApplicationController
    
    def new
        @person = Person.find(params[:person_id])
        @education = @person.educations.build(education_params)
    end

    def create
        @person = Person.find(params[:person_id])
        @education = @person.educations.create(education_params)
        respond_to do |f|
            if @education.save
                f.html {
                    redirect_to root_path,
                    notice: "Successfully Saved"
                }
            else
                f.html{
                    redirect_to root_path,
                    alert: "Error in creating: #{@education.erros.full_messages}"
                }
            end
        end
    end
    
    def show
    end

    def edit
    end

    def update
    end
    
    def destroy
    end

    private

        def education_params
            params.fetch(:education, {}).permit(
                :elementary_school,
                :elementary_year,
                :secondary_school,
                :secondary_year,
                :tertiary_school,
                :tertiary_year
            )
        end
end