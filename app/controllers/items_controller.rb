class ItemsController < ApplicationController
	def index
		@filtered_ingredients = Item.where('lower(name) LIKE ?', params[:q] + '%').map { |ingredient| {id: ingredient.id, name: ingredient.name}}

		respond_to do |format|
			format.json { render json: @filtered_ingredients }
		end
	end
end
