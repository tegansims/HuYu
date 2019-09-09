class AddImagePathToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :img_path, :string
  end
end
