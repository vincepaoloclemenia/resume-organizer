class Education < ApplicationRecord
    belongs_to :person

    validates_presence_of :education_level, :school_name, :year_attended

    Levels = ["Elementary", "Secondary", "Tertiary"]

    def self.undergraduate?
        if all.pluck(:education_level).to_set.superset?(Levels.to_set)
            return "College Graduate"
        else
            return "Undergraduate"
        end 
    end
end
