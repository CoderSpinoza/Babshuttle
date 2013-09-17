class DeliverySession < ActiveRecord::Base
	belongs_to :driver
	has_many :orders
end
