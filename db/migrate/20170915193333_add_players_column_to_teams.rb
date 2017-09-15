class AddPlayersColumnToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :players, :string
  end
end
