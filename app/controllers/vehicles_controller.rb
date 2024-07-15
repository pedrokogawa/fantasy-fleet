class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show]

    # //root page// has @vehicles ~ test OK 
    def index
        @vehicles = Vehicle.all
    end
    
    # show has @vehicle ~ test OK 
    def show
    end

    def new
    end   
    
    def create
    end

    def edit
    end    
    
    def update
    end

    def destroy
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
end
