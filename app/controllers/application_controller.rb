class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :authorize
  
  private  

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

  def logged_in?
    !!current_member
  end

  helper_method :current_member

  def require_login
    unless logged_in?
      redirect_to new_session_path, notice: "Please log in to access this page."
    end
  end

  def current_permission
    @current_permission ||= Permission.new(current_member)
  end  

  def authorize
    if !current_permission.allow
      redirect_back(fallback_location: new_session_path, notice: "Unauthorized To Access This Page.")
    end
  end 
end
