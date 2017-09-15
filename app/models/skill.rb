class Skill < ApplicationRecord
    belongs_to :person
    validates_presence_of :competency, :skill_name
end
