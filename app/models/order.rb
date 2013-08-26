class Order < ActiveRecord::Base

	belongs_to :user, dependent: :destroy
	private
	  def app_params
	    params.require(:order).permit(:user_id, :items, :time, :updated_at, :created_at)
	  end
end
