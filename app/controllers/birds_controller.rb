class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #render json: {id: bird.id, name: bird.name, species: bird.species}
    #Here, we've created a new hash out of three keys, assigning the keys manually with the attributes of bird.
  #OR: 
  if bird
  render json: bird.slice(:id, :name, :species)
  else
    render json: {message: 'Bird not found'}
  end
  end
end