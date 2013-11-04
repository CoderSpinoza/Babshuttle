FactoryGirl.define do
	factory :address do
		association :user
	end
end