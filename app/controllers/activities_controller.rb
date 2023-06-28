class ActivitiesController < ApplicationController
    def index
        activities = Activity.all  
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
          activity.destroy
          head :no_content
        else
          head :not_found
        end
    end
end
