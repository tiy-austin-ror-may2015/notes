class EmployeeCourse < ActiveRecord::Base
  # Active Record Association
  belongs_to :course
  belongs_to :employee

  # Active Model Validators
  validates_uniqueness_of :employee_id, scope: :course_id
end
