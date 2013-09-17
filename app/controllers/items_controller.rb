# encoding: utf-8
class ItemsController < ApplicationController
	def index
		# @starts_with = Item.find(:all, :conditions => ['lower(name) LIKE ?', params[:q] + '%'])

		if params[:q]
			@contains = Item.find(:all, :conditions => ['lower(name) LIKE ?', '%' + params[:q] + '%'])
		end
		# @filtered_ingredients = (@starts_with + @contains).uniq

		@items = Item.all
		respond_to do |format|
			format.html
			format.json { render json: @contains }
		end
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			flash[:notice] = "You have successfully created #{@item.name}."
			redirect_to items_path
		else
			flash[:alert] = @item.errors.full_messages.join(', ')
			redirect_to :back
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
			flash[:notice] = "You have successfully edited #{@item.name}."
			redirect_to items_path
		else
			flash[:alert] = @item.errors.full_messages.join(', ')
			redirect_to :back
		end

	end

	def show
		@item = Item.find(params[:id])
	end

	def query
		@filtered_ingredients = Item.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q]}%"])
		respond_to do |format|
			format.json { render json: @filtered_ingredients }
		end
	end

	def destroy
	end

	private
		def item_params
			params.require(:item).permit(:name, :price, :amount, :unit, :picture)
		end
end
