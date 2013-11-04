FactoryGirl.define do
	factory :brand do
		sequence(:name) { |i| "Item#{i}"}
	end
end