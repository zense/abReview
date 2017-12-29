require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "review" do
    mail = NotificationsMailer.review
    assert_equal "Review", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "abstract" do
    mail = NotificationsMailer.abstract
    assert_equal "Abstract", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
