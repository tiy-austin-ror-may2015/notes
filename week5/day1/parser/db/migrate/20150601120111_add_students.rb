class AddStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :course
    end
  end
end
