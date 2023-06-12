class MembersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :authorize, only: [:show, :new, :create]

  def index
  @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save

      if current_member
         redirect_to members_path, notice: 'Member was successfully created.'
      else
        redirect_to new_session_path, notice: 'Member was successfully created.'
      end
    else
      if current_member
      redirect_to members_path, notice: 'Unable to create member'
      else
        redirect_to new_session_path, notice: 'Unable to create member.'
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to member_path(@member), notice: 'Member was successfully updated.'
    else
      redirect_to members_path, notice: 'Unable to update member'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.id == current_member.id
      @member.destroy
      session[:member_id] = nil
      redirect_to new_session_path, notice: @member.firstName + ' Member was successfully destroyed And Logged Out.'
    else
      @member.destroy
      redirect_to members_path, notice: @member.firstName + ' Member was successfully destroyed.'
    end
  end

  def search
    @members = Member.where('firstName LIKE ?', "%#{params[:name]}%")
  end

  private

  def member_params
    params.require(:member).permit(:firstName, :lastName, :mobileNumber, :address, :expiryDate, :username, :password_digest, :role)
  end
end
