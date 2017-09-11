class PageController < ApplicationController

    def home
        @people = Person.all
    end
    
end
