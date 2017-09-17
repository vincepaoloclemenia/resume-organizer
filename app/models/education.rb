class Education < ApplicationRecord
    belongs_to :person

    validates_presence_of :education_level, :school_name, :year_attended

    Levels = ["Elementary", "Secondary", "Tertiary"]

end
