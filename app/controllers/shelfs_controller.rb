class ShelfsController < ApplicationController
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

    redirect_to sections_path, notice: 'Shelf was successfully destroyed.'
  end

  private

  def shelf_params
    params.require(:shelf).permit(:name, :section_id)
  end
end