class AddPictureUploaderResume < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :avatar, :string
  end
end
