require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  test "create successful" do
    course = FactoryGirl.create(:course)
    sign_in course.user
    post :create, :course_id => course.id, :section => {:title => 'Ruby'}
    assert_redirected_to instructor_course_path(course)
  end

  test "create unsuccessful when current logged in instructor is not course creator" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    sign_in user
    post :create, :course_id => course.id, :section => {:title => 'Ruby'}
    assert_response :unauthorized
  end
end
