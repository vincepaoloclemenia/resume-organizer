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

    validates_presence_of :first_name, allow_nil: false
    validates_presence_of :last_name, allow_nil: false
    validates_presence_of :middle_name, allow_nil: false
    validates_presence_of :birthday, allow_nil: false
    validates_presence_of :age, allow_nil: false
    validates_presence_of :gender, allow_nil: false
    validates_presence_of :status, allow_nil: false
    validates_presence_of :height, allow_nil: false
    validates_presence_of :weight, allow_nil: false

end
