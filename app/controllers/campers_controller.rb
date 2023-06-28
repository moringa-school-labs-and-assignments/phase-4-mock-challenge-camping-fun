class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end
end
