class Api::MembersController < ApplicationController
  before_action :require_login
  
  def index
    firstName = params[:firstName]
    @members = Member.where("firstName LIKE ?", "%#{firstName}%")
    @members
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, notice: "Please log in to access this page."
    end
  end
end
