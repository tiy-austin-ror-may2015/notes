class CreateScreencasts < ActiveRecord::Migration
  def change
    create_table :screencasts do |t|
      t.string :title
      t.string :url
      t.integer :price

      t.timestamps null: false
    end
  end
end
