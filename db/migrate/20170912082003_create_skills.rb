class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :competency
      t.string :skill_name
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
