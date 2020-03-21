class AddUniqueTruetoUserNames < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_names, :user_id
    add_index :user_names, :user_id, unique: true
  end
end
