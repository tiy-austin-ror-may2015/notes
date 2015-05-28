class AddSave < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.string  :word
      t.integer :guesses_left
      t.string  :guesses_made
    end
  end
end
