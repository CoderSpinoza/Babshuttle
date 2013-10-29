class HomeController < ApplicationController
	before_filter :set_new_user

	def set_new_user
		@user = User.new
	end
	def index
		if @current_user
			if @current_user.korean?
				redirect_to new_order_path
			else
				redirect_to "/fan/wait"
			end
		else
			@market = "korean"
			@style = "btn-info"
		end
	end

	def about
	end

	def team
	end

	def contact
	end

	def fan
		@market = "chinese"
		@style = "btn-danger"
	end

	def congrat
	end

	def metrics
		if current_user.admin?
			# building users metrics
			@users_count = User.count
			@users = User.select("DATE(created_at), COUNT(id)").order("DATE(created_at) ASC").group("DATE(created_at)")
			@users_hash = @users.map { |user| { x: user.date.strftime("%s").to_i * 1000, y: user.count }}

			@accumulated_users_list = []

			accumulated_count = 0
			@users_hash.each do |date|
				accumulated_count += date[:y]
				accumulated_users_hash = {x: date[:x], y: accumulated_count}
				@accumulated_users_list << accumulated_users_hash
			end


			# building orders metrics

			@orders_count = Order.count
			@orders = Order.select("DATE(created_at), COUNT(id)").order("DATE(created_at) ASC").group("DATE(created_at)")
			@orders_hash = @orders.map { |order| { x: order.date.strftime("%s").to_i * 1000, y: order.count}}
			@accumulated_orders_list = []

			accumulated_count = 0
			@orders_hash.each do |date|
				accumulated_count += date[:y]
				accumulated_orders_hash = {x: date[:x], y: accumulated_count}
				@accumulated_orders_list << accumulated_orders_hash
			end
		else
			render "public/401.html"
		end
	end

	# def stats
	# 	g = Gruff::Line.new
	# 	@users = User.select("DATE(created_at), COUNT(id)").order("DATE(created_at) ASC").group("DATE(created_at)")

	# 	@hash = {}
	# 	index = 0
	# 	(@users[0].date..Date.current).each do |date|
	# 		@hash[index] = date.to_s
	# 		index += 1
	# 	end
	# 	g.labels = @hash
	# 	g.data :Users, @users.map { |user| user.count }
	# 	send_data(g.to_blob, disposition: 'inline', type: 'image/png', filename: 'users_metrics.png')
	# end
end
