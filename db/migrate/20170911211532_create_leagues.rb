class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.integer :league_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
