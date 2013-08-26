class RegistrationsController < Devise::RegistrationsController
	protected
	def after_sign_up_path_for(resource)
		flash[:registered] = "true"
		congrat_path
	end
end
