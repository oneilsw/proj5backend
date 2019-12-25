class OpenHousesController < ApplicationController
    def index
        open_house = OpenHouse.all
        render json: open_house
    end 

    def show 
        open_house = open_house.find(params[:id])
        render json: open_house
    end 

    def create 
        open_house = OpenHouse.create(open_house_params)
        if open_house.valid?
            render json: open_house
        else
            render json: {errors: open_house.errors}
        end
    end 

    def update
        open_house = OpenHouse.find(params[:id])
        open_house.update(open_house_params)
        if open_house.valid?
            render json: open_house
        else
            render json: {errors: open_house.errors}
        end
    end 

    private

    def open_house_params
        params.permit(:date, :time, :details, :listing_id)
    end
end
