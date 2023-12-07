class ApplicationController < ActionController::Base
  skip_forgery_protection
  def authorize_admin
    unless current_user && current_user.role == "admin"
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  def current_user
    @current_user ||= User.find(session.fetch('user_id')) if session.key?('user_id')
  end
end
