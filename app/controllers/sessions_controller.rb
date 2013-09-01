class SessionsController < Devise::SessionsController
	def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
    sign_in(resource_name, resource)
    return render :json => { :success => true, :content => current_user.email }
  end

  def failure
    return render:json => { :message => "Invalid email or password."}, :status => 401
  end

	protected
	def after_sign_in_path_for(resource)
		new_order_path
	end

	def after_sign_out_path_for(resource)
		root_url
	end
end
