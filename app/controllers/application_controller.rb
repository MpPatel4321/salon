class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  #   UserMailer.login_email(current_user).deliver_now if user_signed_in? if (current_user.current_sign_in_at != current_user.last_sign_in_at )
  #   signed_in_root_path(resource_or_scope)
  # end

	protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)}
    end
end
