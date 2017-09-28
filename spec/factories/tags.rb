FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "#тег#{n}" }
  end
end
