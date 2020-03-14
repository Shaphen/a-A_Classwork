class Question < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.timestamps
      t.text :body
      t.integer :poll_id, null: false
    end
    add_index :questions, :poll_id
  end
end
