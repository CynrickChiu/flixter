FactoryGirl.define do
  factory :section do
    title 'Ruby'
    association :course
  end
end
