class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, except: [:created_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: "Bird not found with id of #{params[:id]}" }
    end
  end
end