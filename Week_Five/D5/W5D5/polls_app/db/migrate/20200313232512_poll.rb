class Poll < ActiveRecord::Migration[5.2]
  def change
      create_table :polls do |t|
        t.timestamps
        t.string :title
        t.integer :author_id, null: false
      end
    add_index :polls, :author_id
  end
end