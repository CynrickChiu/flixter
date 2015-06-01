FactoryGirl.define do
  factory :lesson do
    title 'Ruby Strings'
    subtitle 'All about Ruby string'
    association :section
  end
end
