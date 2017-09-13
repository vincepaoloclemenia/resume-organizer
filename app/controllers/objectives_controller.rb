class ObjectivesController < ApplicationController

    before_action :find_person
    before_action :find_objective, only: [:edit, :update, :destroy]

    def index

    end

    def create
        @objective = @person.objectives.create(objective_params)
        respond_to do |f|
            if @objective.save
                f.html{
                    redirect_to person_objectives_path(@person),
                    notice: "An objective was created"
                }
            else
                f.html{ render 'new', alert: "Somethin went wrong: #{@objective.errors.full_messages}" }
            end
        end
    end

    def edit

    end

    def update
        respond_to do |f|
            if @objective.update(objective_params)
                f.html{ redirect_to person_objectives_path(@person), notice: "You have update an objective"}
            else
                f.html { render 'edit', alert: "Unable to update: #{@objective.errors.full_messges}"}
            end
        end
    end

    def destroy
        @objective.destroy
        redirect_to person_objectives_path(@person)
        flash[:alert] = "You have just deleted an objective"
    end
    
    private

        def objective_params
            params.fetch(:objective, {}).permit(:description)
        end

        def find_objective
            @objective = Objective.find_by_id(params[:id])
            if @objective.nil?
                redirect_to root_path 
                flash[:alert] = "No objective found to continue"
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