class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :attribute_type
      t.string :attribute_value

      t.timestamps
    end
  end
end
