class Order < ActiveRecord::Base

	belongs_to :user
	belongs_to :address

	after_create :send_order_email

	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :address

	def send_order_email
		UserMailer.order(self).deliver
	end

	def user_attributes=(user_attributes)
		self.user = User.find(user_attributes[:id])
		self.user.update_attributes(user_attributes)
	end

	def today?
		return self.time.day == Time.now.utc.day
	end
	
end
