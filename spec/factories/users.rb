FactoryGirl.define do
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		password "Babshuttle2013"
		password_confirmation "Babshuttle2013"
		market "korean"
	end
end