class Api::BeersController < ApplicationController
  def index
    render json: Beer.all
  end
end
