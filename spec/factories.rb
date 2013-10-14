FactoryGirl.define do
	sequence :email do |n|
		"email#{n}@babshuttle.com"
	end

	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		password "Babshuttle2013"
		password_confirmation "Babshuttle2013"
	end
	factory :order do
	end

	factory :item do
	end

  factory :address do
    street "MyString"
    apt "MyString"
    zipcode "MyString"
  end
end