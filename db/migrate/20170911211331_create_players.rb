class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :position
      t.integer :age
    end
  end
end
