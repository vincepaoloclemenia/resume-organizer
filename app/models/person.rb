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
    #attr_accessible :educations_attributes, :objectives_attributes, :skills_attributes, :references_attributes, :experiences_attributes
    validates_presence_of :first_name, :last_name, :middle_name, :birthday, :age, :gender, :status, :height, :weight
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
    validates_format_of :weight,:height,:age, with: /\A[0-9]/
    validates_format_of :mobile_number,:landline_number, with: /\A[\d-]/
    
    has_many :educations, dependent: :destroy
    has_many :objectives, dependent: :destroy
    has_many :references, class_name: "CharacterReference", dependent: :destroy
    has_many :skills, dependent: :destroy
    has_many :experiences, dependent: :destroy  
    accepts_nested_attributes_for :objectives, :educations, :skills, :references, :experiences, allow_destroy: true
    default_scope { order(created_at: :desc) }

    scope :recent, -> { order(created_at: :desc) }

    Status = ["Single","Married"]
    Gender = ["Male", "Female"]
    
    def resume_status
        if educations.exists? && objectives.exists? && references.exists? && skills.exists?
            return "Complete Information"
        else
            return "Incomplete Information"
        end
    end

    def has_three_references?
        total = references.size
        need = 3 - total
        if  total < 3
            return "Needs #{need} more #{"reference".pluralize(need)}"
        end      
    end

    def has_three_objectives?
        total = objectives.size
        need = 3 - total
        if total < 3
            return "Needs #{need} more #{"objective".pluralize(need)}"
        end
    end

    def has_skills?
        unless skills.any? 
            return "Incomplete: No Skill Set yet"
        end
    end

    def has_educations?
        unless educations.any? 
            return "No educational record yet"
        end
    end

    def education_status
        if educations.pluck(:education_level).include?("Tertiary")
            return "College Graduate"
        else
            return "Undergraduate"
        end 
    end


    mount_uploader :avatar, AvatarUploader
end
