class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_admin?, :is_student?
  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def is_admin?
		current_user && current_user.type == "Admin"
	end

	def is_student?
		current_user && current_user.type == "Student"
	end

	def configure_permitted_parameters
		added_attrs = [:email, :password, :password_confirmation, :remember_me, :current_password, :type]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
end
