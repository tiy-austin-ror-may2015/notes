class Course < ActiveRecord::Base
  belongs_to :location
  has_many :employee_courses
  has_many :employees, through: :employee_courses
end
