
class BirdsController < ApplicationController
  #can see the method actions in routes

  def index
    birds = Bird.all
    #slice won't work here, so we can use the only: option (public method in rails) to grab tha data we want
    render json: birds, only: [:id, :name, :species]
    #we can also use except if we want to exclude certain pieces of data
    render json: birds, except: [:created_at, :updated_at]
    #below is longhand code showing the method used to convert an array to json string (parsing data to make it more readable)
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    #shows all of our collection
    #render json: bird
    #here we are grabbing just the data we need by assigning the keys manually using attributes of bird
    #this allows us to ommit some data
    #here we are going to use an if else statement to render a message if data does not exist
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    #this code also slices data - a bit more efficient than above code
    # render json: bird.slice(:id, :name, :species)
end
