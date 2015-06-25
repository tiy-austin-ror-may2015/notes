class CreateScreencastOrders < ActiveRecord::Migration
  def change
    create_table :screencast_orders do |t|
      t.belongs_to :screencast, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
