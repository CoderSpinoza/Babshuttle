class Item < ActiveRecord::Base

	validates :name, presence: true
	private
		def app_params
			params.require(:item).permit(:name)
		end
end
