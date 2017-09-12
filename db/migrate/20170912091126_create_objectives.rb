class CreateObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
      t.references :person, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
