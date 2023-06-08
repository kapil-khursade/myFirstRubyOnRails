class Api::MembersController < ApplicationController
  def index
    firstName = params[:firstName]
    @members = Member.where("firstName LIKE ?", "%#{firstName}%")
    @members
  end
end
