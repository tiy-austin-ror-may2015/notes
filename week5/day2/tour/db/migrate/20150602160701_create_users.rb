class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :course, null: false, default: 'Ruby on Rails'
      t.integer :gpa, default: 0
      t.boolean :has_car, default: true
    end
  end
end
