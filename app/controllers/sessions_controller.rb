class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    member = Member.find_by_username(username)

    if member && member.password_digest == password
      session[:member_id] = member.id
      redirect_to sections_path, notice: "Logged In Successfully"
    else
      redirect_to new_session_path, notice: "Logged In Falied"
    end  
  end

  def destroy
    session[:member_id] = nil
    redirect_to new_session_path, notice: "Logged Out"
  end 
end
