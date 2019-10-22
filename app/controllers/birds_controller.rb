class BirdsController < ApplicationController
  def index
    #basic rendering of all data
    # birds = Bird.all
    # render json: birds

    #means to display only certain info:
    # birds = Bird.all
    # render json: birds, only: [:id, :name, :species]

    #can also use an exclude keyword to do this the opposite way:
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]

    #underneath this code is this:
  #   birds = Bird.all
  # render json: birds.to_json(except: [:created_at, :updated_at])
  end
 
  def show
    #basic json rendering
    # bird = Bird.find_by(id: params[:id])
    # render json: bird

    #limit json rendering to specific fields to exclude sensitive or unwanted info:
    # bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    
    #or alternately: this produces the same thing, less work:
    # bird = Bird.find_by(id: params[:id])
    # render json: bird.slice(:id, :name, :species)

    #but instead now with error message:
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end