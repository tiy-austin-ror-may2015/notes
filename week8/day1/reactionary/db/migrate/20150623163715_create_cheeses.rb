class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.cheese :style

      t.timestamps null: false
    end
  end
end
