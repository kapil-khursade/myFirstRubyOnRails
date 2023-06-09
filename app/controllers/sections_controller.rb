class SectionsController < ApplicationController
  before_action :require_login
  before_action :authorize, except: [:index, :show]
  
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
    # @shelfs = Shelf.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to section_path(@section), notice: 'Section was successfully created.'
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update(section_params)
      redirect_to section_path(@section), notice: 'Section was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to sections_path, notice: @section.name + ' Section was successfully destroyed.'
  end

  private

  def section_params
    params.require(:section).permit(:name)
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, notice: "Please log in to access this page."
    end
  end
end