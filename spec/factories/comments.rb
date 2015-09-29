# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    link_id 1
    body "MyText"
    user nil
  end
end
