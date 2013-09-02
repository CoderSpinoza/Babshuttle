class Address < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	def full_address
		self.street + " " + self.apt + " " + self.zipcode
	end
end
