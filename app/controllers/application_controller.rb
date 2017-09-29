class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

      # Need to redirect users to the profile page
    # def after_sign_in_path_for(resource)
    #   @user = User.friendly.find(params[:slug])
    #   redirect_to user_path(@user)
    # end

end
