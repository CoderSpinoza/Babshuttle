class RegistrationsController < Devise::RegistrationsController

	def create
    build_resource
    resource = User.new(user_params)
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        # respond_with resource, :location => after_sign_up_path_for(resource)
        render json: {message: "success"}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        render json: {message: "Inactive"}, status: 401
      end
    else
      clean_up_passwords resource
      render json: {message: resource.errors.full_messages, user: resource}, status: 402
    end
  end

	protected
		def after_sign_up_path_for(resource)
			new_order_path
		end

	private
		def user_params
	    params.require(:user).permit(:name, :address, :email, :password, :password_confirmation, :updated_at, :created_at)
	  end
end
