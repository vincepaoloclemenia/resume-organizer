class PageController < ApplicationController

    def home
        @people = Person.all
    end

    def second_phase
    end

    def final_phase
    end
    
end
