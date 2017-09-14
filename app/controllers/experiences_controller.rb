class ExperiencesController < ApplicationController
    before_action :find_person
    before_action :find_experience, only: [:edit, :update, :destroy]

    def index

    end

    def create
        @experience = @person.experiences.create(experience_params)
        respond_to do |f|
            if @experience.save
                f.html{
                    redirect_to person_experiences_path(@person),
                    notice: "An experience was created"
                }
            else
                f.html{ render 'new', alert: "Somethin went wrong: #{@experience.errors.full_messages}" }
            end
        end
    end

    def edit

    end

    def update
        respond_to do |f|
            if @experience.update(experience_params)
                f.html{ redirect_to person_experiences_path(@person), notice: "You have update an experience"}
            else
                f.html { render 'edit', alert: "Unable to update: #{@experience.errors.full_messges}"}
            end
        end
    end

    def destroy
        @experience.destroy
        redirect_to person_experiences_path(@person)
        flash[:alert] = "You have just deleted an experience record"
    end
    
    private

        def experience_params
            params.require(:experience).permit(:company, :position, :year_employed, :task)
        end

        def find_experience
            @experience = experience.find_by_id(params[:id])
            if @experience.nil?
                redirect_to root_path 
                flash[:alert] = "No experience found to continue"
            end
        end

        def find_person
            @person = Person.find_by_id(params[:person_id])
            if @person.nil?
                redirect_to root_path 
                flash[:alert] = "No Resume found to continue"
            end
        end
end