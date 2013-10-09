class Order < ActiveRecord::Base

	belongs_to :user
	belongs_to :address
	belongs_to :delivery_session
	
	after_create :send_order_email

	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :address

	validates :items, presence: true
	validates :phone_number, presence: true, length: { minimum: 10 }
	# validates :address_id, presence: true

	def send_order_email
		UserMailer.order(self).deliver
	end

	def user_attributes=(user_attributes)
		self.user = User.find(user_attributes[:id])
		self.user.update_attributes(user_attributes)
	end

	def today?
		self.time.to_date == Time.now.to_date
	end

	def editable?
		if Time.now.hour >= 15
			self.time.to_date >= Time.now.tomorrow.to_date
		else
			self.time.to_date == Time.now.to_date
		end
	end
	
end
