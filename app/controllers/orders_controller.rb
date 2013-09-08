class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@current_user = current_user
		if current_user.admin?
			@orders = Order.includes(:user).includes(:address)
		else
			@orders = Order.where(user: current_user)
		end
	end

	def new
		@order = Order.new
		@order.user = current_user
		@order.address = current_user.addresses.first || Address.new
		@last_order = current_user.orders.last
		@today = Time.new
		@tomorrow = Time.new + 3600 * 24
		if Time.new.hour >= 15
			@dates = {"Tomorrow" => @tomorrow}
		else
			@dates = {"Today" => @today, "Tomorrow" => @tomorrow}
		end
		

		@recommended_items = Item.where('popularity > 0')
		@items = Item.all
	end

	def create
		@order = Order.new(order_params)
		# @address = Address.find_or_create_by(street: params[:order][:address][:street], apt: params[:order][:address][:apt], zipcode: params[:order][:address][:zipcode])

		# @order.user.update_attributes(phone_number: params[:order][:user][:phone_number])
		@order.phone_number = params[:order][:user_attributes][:phone_number]
		if @order.save
			redirect_to order_path(@order)
		else
			flash[:notice] = @order.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@order = Order.find(params[:id])
		if @order.user != current_user
			render "public/401.html"
			return
		end
		@items = @order.items.split(',').map { |item| item.strip }
	end

	def success
		@order = Order.find(params[:id])

		if @order.user != current_user
			render status: :forbidden
		end
	end

	def email
		@users = User.all

		@users.each do |user|
			user.send_refresh_email
		end

		redirect_to :root
	end

	private
	  def order_params
	    params.require(:order).permit(:items, :time, :updated_at, :created_at, address_attributes: [:street, :apt, :zipcode], user_attributes: [:phone_number, :id])
	  end
end
