class Bird < ApplicationRecord
  def show
    bird = Bird.find_by(id: params[:id])
   render json: {id: bird.id, name: bird.name, species: bird.species } 
 end
end