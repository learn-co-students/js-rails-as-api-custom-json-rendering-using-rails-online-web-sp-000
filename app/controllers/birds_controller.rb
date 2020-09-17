class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render :json => birds, :except => [:created_at, :updated_at]
  end	  
 
    def show
      bird = Bird.find_by(id: params[:id])
      if bird
        render json: { id: bird.id, name: bird.name, species: bird.species }
      else
        render json: { message: 'Bird not found' }
      end
    end
  end 

#can also be written as: def index
  #birds = Bird.all
  #render json: birds.to_json(except: [:created_at, :updated_at])
#end
#can create full CRUD based controllers that only render JSon
#takes entire models and have rails convert them to JSON and send them out 
#render json: bird
#http://localhost:3000/birds/2
#produces:
#{"id":2,"name":"Grackle","species":"Quiscalus Quiscula","created_at":"2020-09-17T22:34:21.175Z","updated_at":"2020-09-17T22:34:21.175Z"}