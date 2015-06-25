class Enrollment < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enrollment.enrolled_confirmation.subject
  #
  def enrolled_confirmation(employee, course)
    @employee = employee
    @course = course

    mail to: employee.email, subject: "You've been enrolled!"
  end
end
