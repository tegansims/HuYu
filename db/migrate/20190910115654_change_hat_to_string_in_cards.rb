class ChangeHatToStringInCards < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :hat, :string
  end
end
