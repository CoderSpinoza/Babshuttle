class Address < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	validates :street, presence: true
	validates :zipcode, presence: true
	def full_address
		self.street + " " + self.apt + " " + self.zipcode
	end
end
