class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
	if session['user_id'] == nil
		redirect_to "/login"
	end
  end
end
