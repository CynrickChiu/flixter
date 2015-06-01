require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "should get new" do
    section = FactoryGirl.create(:section)
    sign_in section.course.user
    get :new, :section_id => section.id
    assert_response :success
  end

  test "create successful" do
    section = FactoryGirl.create(:section)
    sign_in section.course.user
    post :create, :section_id => section.id, :lesson => {:title => 'Ruby', :subtitle => 'Ruby Strings'}
    assert_redirected_to instructor_course_path(section.course)
  end
end
