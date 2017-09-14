class Experience < ApplicationRecord
    belongs_to :person
    validates_presence_of :company, :task, :year_employed, :position
end
