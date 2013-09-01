class OrdersController < ApplicationController
	before_filter :authenticate_user!
	def new
		@order = Order.new
		@order.user = current_user

		@today = Time.new
		@tomorrow = Time.new + 3600 * 24
		@dates = [@today, @tomorrow]

		@recommended_items = Item.where('popularity > 0')
		@items = Item.all
	end

	def create
		@order = Order.new(order_params)
		@order.user = current_user

		if @order
			redirect_to success_orders_path
		else
		end
	end
	private
	  def order_params
	    params.require(:order).permit(:items, :time, :updated_at, :created_at)
	  end
end
