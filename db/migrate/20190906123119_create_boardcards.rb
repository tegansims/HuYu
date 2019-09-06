class CreateBoardcards < ActiveRecord::Migration[6.0]
  def change
    create_table :boardcards do |t|
      t.references :card, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
