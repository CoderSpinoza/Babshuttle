class Error404 < StandardError; end
class Error401 < StandardError; end
class NotYourOrder < Error401; end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :devise_user

  rescue_from NotYourOrder, with: :render_401

  def devise_user
  	@current_user = current_user
  end

  def render_401
  	redirect_to "401.html"
  end
end
