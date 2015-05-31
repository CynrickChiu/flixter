require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  test "should get new" do
    course = FactoryGirl.create(:course)
    sign_in course.user
    get :new, :course_id => course.id
    assert_response :success
  end

  test "create successful" do
    course = FactoryGirl.create(:course)
    sign_in course.user
    post :create, :course_id => course.id, :section => {:title => 'Ruby'}
    assert_redirected_to instructor_course_path(course)
  end
end
