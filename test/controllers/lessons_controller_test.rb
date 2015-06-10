require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "show lesson if user is enrolled in course" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    enrolled = FactoryGirl.create(:enrollment, :user_id => user.id, :course_id => course.id)
    section = FactoryGirl.create(:section, :course_id => course.id)
    lesson = FactoryGirl.create(:lesson, :section_id => section.id)
    sign_in user
    get :show, :id => lesson.id
    assert_response :success
  end

  test "redirect user to course show page if user is not enrolled in course" do
    user = FactoryGirl.create(:user)
    lesson = FactoryGirl.create(:lesson)
    sign_in user
    get :show, :id => lesson.id
    assert_redirected_to course_path(lesson.section.course)
  end
end
