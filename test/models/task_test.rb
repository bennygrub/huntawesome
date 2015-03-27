require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    some_undefined_variable
    assert true
  end
end
