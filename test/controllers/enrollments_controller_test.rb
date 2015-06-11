require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  test "enroll successfully in a free course" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course, :cost => 0)
    sign_in user

    post :create, :course_id => course.id, :enrollment => {:user_id => user.id}
    assert_redirected_to course_path(course)
  end

  test "enroll successfully in a premium course" do
    # class FakeCustomer
    #   attr_accessor :id
    #   def initialize(id)
    #     self.id = id
    #   end
    # end

    # customer = FakeCustomer.new(1)

    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)

    Stripe::Customer.expects(:create).returns(user)
    Stripe::Charge.expects(:create).returns({})

    sign_in user
    post :create, :course_id => course.id, :enrollment => {:user_id => user.id}
    assert_redirected_to course_path(course)
  end
end
