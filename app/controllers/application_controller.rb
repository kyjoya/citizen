class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :devise_permitted_parameters, if: :devise_controller?

  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :image, :affiliation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :username, :email, :password_confirmation, :current_password, :image, :affiliation)
    end
  end

  def authenticate!
    unless signed_in?
      flash[:notice] = 'You need to sign in if you want to do that!'
      redirect '/'
    end
  end
end
