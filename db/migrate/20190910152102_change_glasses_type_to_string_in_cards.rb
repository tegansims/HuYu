class ChangeGlassesTypeToStringInCards < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :glasses, :string
  end
end
