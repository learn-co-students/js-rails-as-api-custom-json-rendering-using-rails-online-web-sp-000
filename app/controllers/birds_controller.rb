class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at,:updated_at] alternative
    # render json: birds.to_json(except: [:created_at, :updated_at])  reality
  end
  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird.slilce(:id, :name, :species)
    # render json: {id: bird.id, name: bird.name, species: bird.species} alternative
  end
end
