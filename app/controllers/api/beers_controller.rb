class Api::BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :destroy]

  def index
    render json: Beer.all
  end

  def create
    beer = Beer.new(beer_params)
    if beer.save
      render json: beer
    else
      render json: { message: beer.errors }, status: 400
    end
  end

  def show
    render json: @beer
  end

  def update
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: { message: beer.errors }, status: 400
    end
  end

  def destroy
    if @beer.destroy
      render json: status: 200
    else
      render json: { message: 'Unable to Destroy this Beer' }, status: 400
    end
  end

  private
    def set_beer
      @beer = Beear.find_by(id: params[:id])
    end

    def beer_params
      params.require(:beer).permit(:name, :brand, :style, :abv)
    end
end
