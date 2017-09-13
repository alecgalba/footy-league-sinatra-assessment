class CreateLeagueTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :league_teams do |t|
      t.integer :team_id
      t.integer :league_id
    end
  end
end
