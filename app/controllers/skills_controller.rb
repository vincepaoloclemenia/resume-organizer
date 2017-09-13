class SkillsController < ApplicationController
    before_action :find_person
    before_action :find_skill, only: [:edit, :update, :destroy]

    def index
        @competencies = @person.skills.pluck(:competency).uniq
    end

    def new

    end

    def create
        @skill = @person.skills.create(skill_params)
        respond_to do |f|
            if @skill.save
                f.html{ redirect_to person_skills_path(@person), notice: "A skill was added" }
            else
                f.html{ render 'new', alert: "Something went wrong: #{@person.errors.full_messages}" }
            end
        end            
    end
    
    def edit
    end

    def update
        respond_to do |f|
            if @skill.update(skill_params)
                f.html{ redirect_to person_skills_path(@person), notice: "A skill was updated" }
            else
                f.html{ render 'edit', alert: "Something went wrong: #{@person.errors.full_messages}" }
            end
        end
    end

    def destroy
        @skill.destroy
        redirect_to person_skills_path(@person)
        flash[:alert] = "You have deleted a skill"
    end

    private

        def skill_params
            params.fetch(:skill, {}).permit(
                :skill_name,
                :competency
            )
        end

        def find_skill
            @skill = Skill.find_by_id(params[:id])
            if @skill.nil?
                redirect_to root_path 
                flash[:alert] = "No skill found to continue"
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