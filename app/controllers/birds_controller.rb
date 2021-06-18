class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by_id(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
    else 
      render json: {message: "Bird not found"}
    end
    
  end

end