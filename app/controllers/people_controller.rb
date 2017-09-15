class PeopleController < ApplicationController
    before_action :find_person, only: [:edit, :show, :destroy, :update]

    def new
        @newPerson = Person.new(person_params)
    end

    def create
        @person = Person.new(person_params)
        respond_to do |f|
            if @person.save
                f.html{
                    redirect_to person_path(@person),
                    notice: "Resume Saved"
                }
            else
                f.html{
                    redirect_to new_person_path,
                    alert: "ALERT! Error in Creating: #{@person.errors.full_messages}"
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
            if @person.update(person_params)
                f.html{
                    redirect_to root_path,
                    notice: "You have successfully updated a resume"
                }
            else
                f.html{
                    redirect_to new_person_path,
                    alert: "Error in Updating: #{@person.errors.full_messages}"
                }
            end
        end
    end

    def destroy
        @person.destroy
        redirect_to root_path
        flash[:notice] = "You have just deleted a resume"
    end

    private

        def person_params
            params.fetch(:person, {}).permit(
                :first_name,
                :last_name,
                :middle_name,
                :age,
                :status,
                :birthday,
                :gender,
                :height,
                :weight,
                :mother_name,
                :father_name,
                :main_address,
                :provincial_address,
                :email,
                :mobile_number,
                :landline_number,
                :avatar,
                objectives_attributes: [:description, :id, :_destroy],
                skills_attributes: [:competency, :skill_name, :id, :_destroy],
                references_attributes: [:company, :name, :profession, :contact, :id, :_destroy],
                educations_attributes: [:education_level, :school_name, :year_attended, :id, :_destroy],
                experiences_attributes: [:company, :task, :position, :year_employed, :id, :_destroy]
            )
        end

        def find_person
            @person = Person.find_by(id: params[:id])
        end
end