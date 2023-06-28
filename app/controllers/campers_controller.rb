class CampersController < ApplicationController
    def index
      campers = Camper.all.as_json(except: :activities)
      render json: campers, status: :ok
    end
  
    def show
      camper = Camper.find_by(id: params[:id])
      if camper
        render json: camper, status: :ok
      else
        render json: { error: "Camper not found" }, status: :not_found
      end
    end
  
    def create
      camper = Camper.new(camper_params)
  
      if camper.save
        camper_data = camper.as_json(except: :activities)
        render json: camper_data, status: :created
      else
        render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def camper_params
      params.permit(:name, :age)
    end
end
  