class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :location
  has_many :employee_courses
  has_many :courses, through: :employee_courses

  def full_name
    "#{first_name} #{last_name}"
  end
end
