class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])

    end

    def takeride
        #binding.pry
        @ride = Ride.create
        @ride.attraction = Attraction.find(params[:attraction])
        @ride.user = User.find(params[:user])
        @ride.save
        
        flash[:notice] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
