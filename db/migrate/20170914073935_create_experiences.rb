class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :task
      t.string :year_employed
      t.string :position
      t.references :person, foreign_key: true
      
      t.timestamps
    end
  end
end
