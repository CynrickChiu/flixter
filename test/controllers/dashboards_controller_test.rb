require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  test "visiting dashboard unsuccessful if user is not logged in" do
    get :show
    assert_redirected_to new_user_session_path
  end

  test "visiting dashboard successful if user is logged in" do
    user = FactoryGirl.create(:user)
    sign_in user
    get :show
    assert_response :success
  end
end
