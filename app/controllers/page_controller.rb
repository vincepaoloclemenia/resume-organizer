class PageController < ApplicationController

    before_action :find_person, only: [:resume_info]

    def home
        @people = Person.all
    end
    
end
