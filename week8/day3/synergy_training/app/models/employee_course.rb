class EmployeeCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :employee
end
