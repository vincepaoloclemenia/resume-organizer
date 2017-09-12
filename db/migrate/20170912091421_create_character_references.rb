class CreateCharacterReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :character_references do |t|
      t.references :person, foreign_key: true
      t.string :name
      t.string :contact
      t.string :profession
      t.string :company

      t.timestamps
    end
  end
end
