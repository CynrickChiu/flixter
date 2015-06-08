require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  test "enroll successfully in a course" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    sign_in user

    post :create, :course_id => course.id, :enrollment => {:user_id => user.id}
    assert_redirected_to course_path(course)
  end
end
