class Api::MembersController < ApplicationController
  def index
    email = params[:email]
    @members = Member.where("email LIKE ?", "%#{email}%")
    @members
  end
end
