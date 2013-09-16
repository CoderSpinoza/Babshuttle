class HomeController < ApplicationController
	def index
		@user = User.new
		@current_user = current_user

		if @current_user
			redirect_to new_order_path
		end
	end

	def about
		@user = User.new
		@current_user = current_user
	end

	def team
		@user = User.new
		@current_user = current_user
	end

	def contact
		@user = User.new
		@current_user = current_user
	end

	def congrat
		@user = User.new
		@current_user = current_user
	end

	def metrics
		@users = User.all.order(:created_at)
	end
end
