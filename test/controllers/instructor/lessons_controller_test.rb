require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "create successful" do
    section = FactoryGirl.create(:section)
    sign_in section.course.user
    post :create, :section_id => section.id, :lesson => {:title => 'Ruby', :subtitle => 'Ruby Strings'}
    assert_redirected_to instructor_course_path(section.course)
  end

  test "create unsuccessful when current logged in instructor is not course creator" do
    user = FactoryGirl.create(:user)
    sign_in user
    section = FactoryGirl.create(:section)
    post :create, :section_id => section.id, :lesson => {:title => 'Ruby', :subtitle => 'Ruby Strings'}
    assert_response :unauthorized
  end
end
