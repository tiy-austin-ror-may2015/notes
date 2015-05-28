class AddScoresTable < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string  :name
      t.boolean :won_game
      t.integer :guesses
    end
  end
end
