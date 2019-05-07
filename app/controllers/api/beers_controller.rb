class Api::BeersController < ApplicationController
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
    render json: Beer.find_by(id: params[:id])
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :brand, :style, :abv)
    end
end
