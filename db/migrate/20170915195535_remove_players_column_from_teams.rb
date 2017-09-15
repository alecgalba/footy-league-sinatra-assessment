class RemovePlayersColumnFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :players
  end
end
