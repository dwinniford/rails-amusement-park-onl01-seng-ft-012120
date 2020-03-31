class RidesController < ApplicationController
    def create 
        ride = Ride.new(ride_params) 
        result = ride.take_ride
        if result.class == String 
            session[:message] = result 
        else 
            ride.save 
            session[:message] = "Thanks for riding the #{ride.attraction.name}!"
        end
        redirect_to user_path(ride.user)
    end

    private 

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end