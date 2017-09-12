class FixWeightHeight < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :weight, :string
    change_column :people, :height, :string
    change_column :people, :age, :string
    remove_column :people, :married?
    remove_column :people, :has_children?
  end
end
