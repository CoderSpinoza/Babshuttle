class OrdersController < ApplicationController
	before_filter :authenticate_user!
	def new
		@order = Order.new
		@order.user = current_user

		@today = Time.new
		@tomorrow = Time.new + 3600 * 24
		@dates = [@today, @tomorrow]

		@recommended_items = Item.all
	end

	def create
	end
end
