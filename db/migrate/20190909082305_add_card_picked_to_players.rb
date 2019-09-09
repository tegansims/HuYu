class AddCardPickedToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :card_picked, :integer
  end
end
