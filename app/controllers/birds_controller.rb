class BirdsController < ApplicationController
  def index
    birds = Bird.all
    if bird
      render json: birds.to_json(except: [:created_at, :updated_at])
    else
      render json: {message: 'Bird not found'}
    end
  end
 
  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird.slice(:id, :name, :species)
  end
end