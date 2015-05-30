FactoryGirl.define do
  factory :course do
    title 'Ruby on Rails'
    description 'A course on Ruby on Rails'
    cost 39.99
    association :user
  end
end