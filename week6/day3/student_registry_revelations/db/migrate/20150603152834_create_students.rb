class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :name, default: 'no name'
      t.integer :course_id, null: false
      t.integer :gpa, default: 0

      t.timestamps null: false
    end
  end
end
