class FlatsController < ApplicationController

  before_action :find_flat, only: %i[show]

  def index
    @flats = Flat.all
  end

  def show
    # @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    # @flat = Flat.find(params[:id])
  end

  def update

  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end


  private
  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
