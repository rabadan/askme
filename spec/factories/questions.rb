FactoryGirl.define do
  factory :question do
    association :user
    text 'Как твои дела? #КакойТоТег666 Это точно вопрос?'
  end
end
