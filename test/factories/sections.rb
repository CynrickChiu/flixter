FactoryGirl.define do
  factory :section do
    title 'Ruby'
    row_order 0
    association :course
  end
end
