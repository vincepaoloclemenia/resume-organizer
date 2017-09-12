class AddSchoolName < ActiveRecord::Migration[5.1]
  def change
    add_column :educations, :school_name, :string
  end
end
