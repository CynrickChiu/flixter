require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  test "should get new" do
	  user = FactoryGirl.create(:user)
	  sign_in user
	  get :new
	  assert_response :success
  end

  test "create successful" do
    user = FactoryGirl.create(:user)
    sign_in user
    post :create, {:course => {
      :title => 'Ruby',
      :description => 'Course on Ruby',
      :cost => 99.99
      }
    }
    assert_redirected_to instructor_course_path(Course.last)
  end

  test "create unsuccessful because of invalid data" do
  	user = FactoryGirl.create(:user)
  	sign_in user
    post :create, {:course => {
      :title => '',
      :description => 'Course on Ruby',
      :cost => -1
      }
    }
    assert_response :unprocessable_entity
  end

  test "show found" do
    course = FactoryGirl.create(:course)
    sign_in course.user
    get :show, :id => course.id
    assert_response :success
  end

  test "show not found" do
    course = FactoryGirl.create(:course)
    sign_in course.user
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => 'abc'
    end
  end
end
