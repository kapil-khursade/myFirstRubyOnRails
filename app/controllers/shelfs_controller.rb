class ShelfsController < ApplicationController
  before_action :require_login
  before_action :authorize, except: [:index, :show]
  
  def index
    @shelfs = Shelf.all
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @section_id = params[:section_id]

    if @shelf.save
      redirect_to shelf_path(@shelf), notice: 'Shelf was successfully created.'
    else
      render :new
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
  end

  def update
    @shelf = Shelf.find(params[:id])

    if @shelf.update(shelf_params)
      redirect_to shelf_path(@shelf), notice: 'Shelf was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    @shelf.destroy

    redirect_to shelfs_path, notice: @shelf.name + ' Shelf was successfully destroyed.'
  end

  private

  def shelf_params
    params.require(:shelf).permit(:name, :section_id)
  end

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