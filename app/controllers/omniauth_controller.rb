class OmniauthController < Devise::OmniauthCallbacksController
  skip_after_filter :clear_provider_and_uid
	def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    email = request.env["omniauth.auth"].info.email
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      session[:provider] = request.env["omniauth.auth"].provider
      session[:uid] = request.env["omniauth.auth"].uid
      render "registrations/new"
    end
  end
end
