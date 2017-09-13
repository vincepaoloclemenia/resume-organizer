class Person < ApplicationRecord
    #   Schema Information
    #   t.string "first_name"
    #   t.string "last_name"
    #   t.string "middle_name"
    #   t.integer "age"
    #   t.string "gender"
    #   t.date "birthday"
    #   t.string "mother_name"
    #   t.string "father_name"
    #   t.string "status"
    #   t.integer "height"
    #   t.integer "weight"
    #   t.string "email"
    #   t.boolean "married?"
    #   t.boolean "has_children?"
    #   t.datetime "created_at", null: false
    #   t.datetime "updated_at", null: false

    validates_presence_of :first_name, :last_name, :middle_name, :birthday, :age, :gender, :status, :height, :weight
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
    validates_format_of :weight,:height,:age, with: /\A[0-9]/
    validates_format_of :mobile_number,:landline_number, with: /\A[\d-]/
    
    has_many :educations, dependent: :destroy
    has_many :objectives, dependent: :destroy
    has_many :references, class_name: "CharacterReference", dependent: :destroy
    has_many :skills, dependent: :destroy 


    default_scope { order(created_at: :desc) }

    Status = ["Single","Married"]
    Gender = ["Male", "Female"]
    
    def completed_already?
        if educations.exists? && objectives.exists? && references.exists? && skills.exists?
            return "Complete Information"
        else
            return "Incomplete Information"
        end
    end

end
