class EducationsController < ApplicationController

    before_action :find_person
    before_action :find_education, only: [:update, :destroy, :edit]

    def index
    end
    
    def new

    end

    def create
        @education = @person.educations.create(education_params)
        respond_to do |f|
            if @education.save
                f.html {
                    redirect_to person_educations_path(@person),
                    notice: "Successfully Saved"
                }
            else
                f.html{
                    redirect_to person_educations_path(@person),
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
        respond_to do |f|
            if @education.update(education_params)
                f.html{
                    redirect_to person_educations_path(@person),
                    notice: "You have successfully updated #{@person.first_name}'s resume"
                }
            else
                f.html{
                    redirect_to person_educations_path(@person),
                    alert: "Something went wrong: #{@education.errors.full_messages}"
                }
            end
        end
    end
    
    def destroy
        @education.destroy
        redirect_to person_educations_path(@person)
        flash[:alert] = "You have just successfully deleted a record"
    end

    private

        def education_params
            params.require(:education).permit(
                :education_level,
                :year_attended,
                :school_name
            )
        end

        def find_person
            @person = Person.find_by_id(params[:person_id])
            if @person.nil?
                redirect_to root_path 
                flash[:alert] = "No Resume found to continue"
            end
        end

        def find_education
            @education = Education.find_by_id(params[:id])
            if @education.nil?
                redirect_to root_path 
                flash[:alert] = "Nothing found to continue"
            end
        end

end