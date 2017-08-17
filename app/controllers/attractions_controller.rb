class AttractionsController < ApplicationController
  before_action :set_attraction!, only: [:show, :ride]


  def index
    @attractions = Attraction.all
  end

  def show
  end

  def ride
    @ride = Ride.new(user: current_user, attraction: @attraction)
    messages = @ride.take_ride

    if messages.class != String
      @ride.save
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:message] = messages
    end

    redirect_to user_path(current_user)
  end

  private

  def set_attraction!
    @attraction = Attraction.find(params[:id])
  end
end
