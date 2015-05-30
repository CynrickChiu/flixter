require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end

  test "show found" do
    course = FactoryGirl.create(:course)
    get :show, :id => course.id
    assert_response :success
  end

  test "show not found" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => 'abc'
    end
  end
end
