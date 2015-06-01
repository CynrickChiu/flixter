require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "should get new" do
    section = FactoryGirl.create(:section)
    sign_in section.course.user
    get :new, :section_id => section.id
    assert_response :success
  end

  test "should not get new when current logged in instructor is not course creator" do
    user = FactoryGirl.create(:user)
    sign_in user
    section = FactoryGirl.create(:section)
    get :new, :section_id => section.id
    assert_response :unauthorized
  end

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
