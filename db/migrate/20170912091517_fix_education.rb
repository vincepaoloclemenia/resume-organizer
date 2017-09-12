class FixEducation < ActiveRecord::Migration[5.1]
  def change
    remove_column :educations, :elementary_school
    remove_column :educations, :secondary_school
    remove_column :educations, :tertiary_school
    remove_column :educations, :elementary_year
    rename_column :educations, :secondary_year, :education_level
    rename_column :educations, :tertiary_year, :year_attended
    add_column :people, :main_address, :string
    add_column :people, :provincial_address, :string, allow_nil: true
    add_column :people, :mobile_number, :string
    add_column :people, :landline_number, :string

  end
end
