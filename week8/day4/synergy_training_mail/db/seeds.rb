# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  company = Company.create(name: Faker::Company.name)
  5.times do
    location = company.locations.create(name: Faker::Address.city)
    employee = company.employees.create(first_name: Faker::Name.first_name,
                                           last_name: Faker::Name.last_name,
                                          job_title: Faker::Name.title,
                                          hire_date: Faker::Date.between(10.years.ago, 1.day.ago))
    3.times do
      course = location.courses.create(title: Faker::Company.catch_phrase,
                                  description: Faker::Lorem.paragraph,
                               enrollment_cap: Array(20..100).sample)
      ec = EmployeeCourse.new
      ec.course   = course
      ec.employee = employee
      ec.save
    end
  end
end

