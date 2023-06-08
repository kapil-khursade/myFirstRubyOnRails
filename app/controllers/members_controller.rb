class MembersController < ApplicationController
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
      redirect_to member_path(@member), notice: 'Member was successfully created.'
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to sections_path, notice: @member.firstName + 'Member was successfully destroyed.'
  end

  def search
    @members = Member.where('firstName LIKE ?', "%#{params[:name]}%")
  end

  private

  def member_params
    params.require(:member).permit(:firstName, :lastName, :mobileNumber, :address, :expiryDate)
  end
end
