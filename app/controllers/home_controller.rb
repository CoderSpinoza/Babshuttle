class HomeController < ApplicationController
	def index
		@user = User.new
		@current_user = current_user
	end

	def about
	end

	def team
	end

	def congrat
	end
end
