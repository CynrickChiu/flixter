require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course should be saved with valid data" do
    course = Course.new(:title => 'Some title', :description => 'Some description', :cost => 3.99)
    assert course.save
    assert_equal 1, Course.count
  end

  test "course should not be saved without title" do
    course = Course.new(:title => '', :description => 'Some description', :cost => 3.99)
    assert_not course.save
  end

  test "course should not be saved without description" do
    course = Course.new(:title => 'Some title', :description => '', :cost => 3.99)
    assert_not course.save
  end

  test "course should not be saved without cost" do
    course = Course.new(:title => 'Some title', :description => 'Some description', :cost => nil)
    assert_not course.save
  end

  test "course should not be saved when cost is less than zero" do
    course = Course.new(:title => 'Some title', :description => 'Some description', :cost => -1)
    assert_not course.save
  end

  test "free? method on a free course should return true" do
    course = FactoryGirl.create(:course, :cost => 0)
    assert_equal true, course.free?
  end

  test "free? method on a premium course should return false" do
    course = FactoryGirl.create(:course)
    assert_equal false, course.free?
  end

  test "premium? method on a free course should return false" do
    course = FactoryGirl.create(:course, :cost => 0)
    assert_equal false, course.premium?
  end

  test "premium? method on a premium course should return true" do
    course = FactoryGirl.create(:course)
    assert_equal true, course.premium?
  end
end
