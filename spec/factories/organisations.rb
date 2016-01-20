# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do
    user nil
    name "MyString"
    email "MyString"
    address "MyString"
    phone_number "MyString"
  end
end
