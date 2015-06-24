class CreateEmployeeCourses < ActiveRecord::Migration
  def change
    create_table :employee_courses do |t|
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
