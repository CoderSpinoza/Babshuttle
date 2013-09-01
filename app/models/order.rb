class Order < ActiveRecord::Base
	attr_writer :current_step

	belongs_to :user, dependent: :destroy

	def current_step
		@current_step || steps.first
	end
	def steps
		%w[items address]
	end

	def next_step
		self.current_step = steps[steps.index(current_step) + 1]
	end
end
