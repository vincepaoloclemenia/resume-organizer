class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :age
      t.string :gender
      t.date :birthday
      t.string :mother_name
      t.string :father_name
      t.string :status
      t.integer :height
      t.integer :weight
      t.string :email
      t.boolean :married?
      t.boolean :has_children?

      t.timestamps
    end
  end
end
