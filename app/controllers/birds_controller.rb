class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird 
      render json: {locator: bird.id, type: bird.name, genus: bird.species}
    else 
      render json: {message: "Bird not found"}
    end 
  end 
end