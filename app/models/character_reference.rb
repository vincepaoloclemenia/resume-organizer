class CharacterReference < ApplicationRecord
  belongs_to :person
  validates_presence_of :name, :company, :contact
end
