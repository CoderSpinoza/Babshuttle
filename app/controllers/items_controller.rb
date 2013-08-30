# encoding: utf-8
class ItemsController < ApplicationController
	def index
		@starts_with = Item.find(:all, :conditions => ['lower(name) LIKE ?', params[:q] + '%'])
		puts params[:q]
		@contains = Item.find(:all, :conditions => ['lower(name) LIKE ?', '%' + params[:q] + '%'])

		@filtered_ingredients = (@starts_with + @contains).uniq
		#.map { |ingredient| {id: ingredient.id, name: ingredient.name}}

		respond_to do |format|
			format.json { render json: @contains }
		end
	end

	def query
		@filtered_ingredients = Item.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q]}%"])
		respond_to do |format|
			format.json { render json: @filtered_ingredients }
		end
	end
end
