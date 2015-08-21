require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Stevie'
    last_name 'Rogers'
    email 'steve.rogers@rogers.com'
    phone_number '2813308004'
    password 'fishdicks'
    password_confirmation 'fishdicks'
  end
end
