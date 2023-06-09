class MembersController < ApplicationController
  before_action :require_login, except: [:new, :create]

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
      redirect_to new_session_path, notice: 'Member was successfully created.'
    else
      redirect_to members_path, notice: 'Unable to create member'
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
    @member.destroy

    redirect_to members_path, notice: @member.firstName + 'Member was successfully destroyed.'
  end

  def search
    @members = Member.where('firstName LIKE ?', "%#{params[:name]}%")
  end

  private

  def member_params
    params.require(:member).permit(:firstName, :lastName, :mobileNumber, :address, :expiryDate, :username, :password_digest, :password_confirmation)
  end
 
  def require_login
    unless logged_in?
      redirect_to new_session_path, notice: "Please log in to access this page."
    end
  end
end
