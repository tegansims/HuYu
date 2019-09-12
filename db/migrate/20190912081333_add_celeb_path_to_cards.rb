class AddCelebPathToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :celeb_path, :string
  end
end
