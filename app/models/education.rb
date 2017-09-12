class Education < ApplicationRecord
    belongs_to :person

    Levels = ["Elementary", "Secondary", "Tertiary"]

    def self.undergraduate?
        if all.pluck(:education_level).to_set.superset?(Levels.to_set)
            return "College Graduate"
        else
            return "Undergraduate"
        end 
    end
end
