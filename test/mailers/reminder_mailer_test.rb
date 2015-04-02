require 'test_helper'

class ReminderMailerTest < ActionMailer::TestCase
  test "weekly" do
    mail = ReminderMailer.weekly
    assert_equal "Weekly", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "suggested" do
    mail = ReminderMailer.suggested
    assert_equal "Suggested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
