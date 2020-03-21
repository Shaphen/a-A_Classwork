class CreateUserNames < ActiveRecord::Migration[5.2]
  def change
    create_table :user_names do |t|
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :user_names, :user_id
  end
end
