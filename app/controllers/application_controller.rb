class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city, :first_name, :last_name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:city, :first_name, :last_name, :image])
  end

  private

  def after_sign_in_path_for(resource)
     request.env['omniauth.origin'] || stored_location_for(resource) || user_path(@user)
   end

   def after_update_path_for(resource)
    puts resource
    stored_location_for(resource)
   end

   
end
