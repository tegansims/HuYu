class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :hair_color
      t.string :hair_type
      t.string :gender
      t.boolean :hat
      t.boolean :glasses
      t.string :eye_color
      t.string :facial_hair

      t.timestamps
    end
  end
end
