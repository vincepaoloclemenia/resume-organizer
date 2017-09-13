class CharacterReferencesController < ApplicationController
    before_action :find_person
    before_action :find_reference, only: [:edit, :update, :destroy]

    def index
    end
    
    def new

    end

    def create
        @reference = @person.references.create(reference_params)
        respond_to do |f|
            if @reference.save
                f.html {
                    redirect_to person_character_references_path(@person),
                    notice: "Successfully Saved"
                }
            else
                f.html{
                    redirect_to person_references_path(@person),
                    alert: "Error in creating: #{@reference.erros.full_messages}"
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
            if @reference.update(reference_params)
                f.html{
                    redirect_to person_character_references_path(@person),
                    notice: "You have successfully updated #{@person.first_name}'s resume"
                }
            else
                f.html{
                    redirect_to person_character_references_path(@person),
                    alert: "Something went wrong: #{@reference.errors.full_messages}"
                }
            end
        end
    end
    
    def destroy
        @reference.destroy
        redirect_to person_character_references_path(@person)
        flash[:alert] = "You have just successfully deleted a record"
    end

    private

        def reference_params
            params.require(:character_reference).permit(
                :name,
                :contact,
                :company,
                :profession
            )
        end

        def find_reference
            @reference = CharacterReference.find_by_id(params[:id])
            if @reference.nil?
                redirect_to root_path 
                flash[:alert] = "No existing record found to continue"
            end
        end

        def find_person
            @person = Person.find_by_id(params[:person_id])
            if @person.nil?
                redirect_to root_path 
                flash[:alert] = "No existing resume found to continue"
            end
        end
end