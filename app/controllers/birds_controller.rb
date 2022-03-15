class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(params.permit(:name, :species))
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(bird_params)
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  
  private 

  def bird_params
    params.permit(:name, :species)
  end

end
