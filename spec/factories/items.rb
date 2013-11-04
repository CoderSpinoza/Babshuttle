FactoryGirl.define do
	factory :item do
		string "Item"
		association :brand
	end
end