class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :elementary_school
      t.string :elementary_year
      t.string :secondary_school
      t.string :secondary_year
      t.string :tertiary_school
      t.string :tertiary_year
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
