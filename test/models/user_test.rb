require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "enrolled_in?" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    enrollment = FactoryGirl.create(:enrollment, {:user_id => user.id, :course_id => course.id})

    enrolled = user.enrolled_in?(course)
    assert_equal true, enrolled
  end
end
