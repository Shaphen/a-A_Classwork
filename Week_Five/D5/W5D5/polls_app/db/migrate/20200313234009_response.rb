class Response < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.ineger :response_id, null: false
      t.timestamps
    end
    add_index :responses, :question_id, :user_id
  end
end
