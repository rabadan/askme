FactoryGirl.define do
  factory :user do
    sequence(:username) { "user#{rand(999)}" }
    sequence(:email) { |n| "user#{n}@test.com" }

    after(:build) { |u| u.password_confirmation = u.password = '123456'
    }
  end
end
