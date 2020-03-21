class DropUserName < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_names
  end
end
