class SessionsController < Devise::SessionsController
	protect_from_forgery except: [:create]

	def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "sessions#failure")
    sign_in(resource_name, resource)
    resource.ensure_authentication_token
    return render :json => { :success => true, :content => current_user.email, authentication_token: current_user.authentication_token }
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
