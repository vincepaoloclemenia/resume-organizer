class Objective < ApplicationRecord
  
  belongs_to :person
  validates_presence_of :description

end
