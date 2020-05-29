class BirdsController < ApplicationController
  def index
    # birds = Bird.all
    # render json: birds
    # def index
  birds = Bird.all
  render json: birds
  # render json: birds, only: [:id, :name, :species]
  # rendering json to specific controller actions
  end
  # def show
  #
  #   bird = Bird.find_by(id: params[:id])
  #   byebug
  #   render json:{ bird
  # end
  def show
    # bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    bird = Bird.find_by(id: params[:id])
    # byebug
  if bird
    render json: { id: bird.id, name: bird.name, species: bird.species }
  else
    render json: { message: 'Bird not found' }
  end
  end

end
