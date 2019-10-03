class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, except: [:created_at, :updated_at]
  end

  def show
    if find_bird
      render json: @bird.slice(:id, :name, :species)
    else 
      render json: {message: 'Bird not found'}
    end 
  end

  private

  def find_bird
    @bird = Bird.find_by(id:params[:id])
  end
end