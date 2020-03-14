class AnswerChoice < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :answer
      t.timestamps
    end
  end
end
