class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #render json: bird.slice(:id, :name, :species)
    #render json: {id: bird.id, name: bird.name, species: bird.species }
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end
