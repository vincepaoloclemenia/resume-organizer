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
                    redirect_to new_person_education_path(@person),
                    notice: "Resume Saved"
                }
            else
                f.html{
                    redirect_to root_path,
                    alert: "Error in Creating: #{@person.errors.full_messages}" 
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
                    redirect_to root_path,
                    alert: "Error in Updating: #{@person.erors.full_messages}"
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
                :father_name
            )
        end

        def find_person
            @person = Person.find(params[:id])
        end
end