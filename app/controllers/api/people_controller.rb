class Api::PeopleController < ApplicationController    
    def index
        @vitaes = Person.all.recent.paginate(page: params[:page], per_page: 5)
    end
end
