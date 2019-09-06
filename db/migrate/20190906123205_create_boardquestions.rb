class CreateBoardquestions < ActiveRecord::Migration[6.0]
  def change
    create_table :boardquestions do |t|
      t.references :board, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
