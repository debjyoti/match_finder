class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    if user_signed_in? and current_user.profile then
      profiles_path
    else
      welcome_path
    end
  end

  def after_sign_out_path_for(user)
    new_user_session_path
  end
end
