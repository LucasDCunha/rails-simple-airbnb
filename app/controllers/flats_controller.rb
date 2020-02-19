class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(params[:id])
    else
      render :edit
    end
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

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description,
                                 :price_per_night, :number_of_guests)
  end
end
