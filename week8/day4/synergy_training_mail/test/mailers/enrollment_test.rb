require 'test_helper'

class EnrollmentTest < ActionMailer::TestCase
  test "enrolled_confirmation" do
    mail = Enrollment.enrolled_confirmation
    assert_equal "Enrolled confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
