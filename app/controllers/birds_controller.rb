class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # OR render json: birds, except: [:created_at, :updated_at]
  end
  
  # rails magic REVEALED: in reality, this is what's really happening, 'only' and 'except' are parameters passed into the to_json method:
  
  # def index
  #   birds = Bird.all
  #   render json: birds.to_json(except: [:created_at, :updated_at])
  # end

  def show
    bird = Bird.find_by(id: params[:id])
    #render json: bird.slice(:id, :name, :species)
    if bird
      render json: bird, except: [:created_at, :updated_at]
    else
      render json: { message: 'Bird not found'}
    end
  end
end