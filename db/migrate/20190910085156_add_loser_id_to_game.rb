class AddLoserIdToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :loser, :integer
  end
end
