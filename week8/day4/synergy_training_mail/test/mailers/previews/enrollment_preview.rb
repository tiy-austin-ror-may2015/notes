# Preview all emails at http://localhost:3000/rails/mailers/enrollment
class EnrollmentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enrollment/enrolled_confirmation
  def enrolled_confirmation
    Enrollment.enrolled_confirmation
  end

end
