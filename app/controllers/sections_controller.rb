class SectionsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
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
end