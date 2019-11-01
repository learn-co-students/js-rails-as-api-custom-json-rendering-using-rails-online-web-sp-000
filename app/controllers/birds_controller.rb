class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds.to_json 
  end

  def show
    if bird = Bird.find_by(id: params[:id])
     render json: bird.slice(:id, :name, :species)
  else 
    render json: {message: 'Bird not found'}
    end
  end
end