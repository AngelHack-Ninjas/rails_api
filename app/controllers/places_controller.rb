class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  def index
    @places = []
    user = {"lat": params[:lat],"long": params[:long]}
    Place.all.each do |place|
      if place.is_happy?
        if !params[:lat] || !params[:long]
          @places.push(place)
        else
          @places.push({place: place, hours: place.hours.all, distance: place.get_distance(user)})
        end
      end
    end
    if params[:lat] || params[:long]
      @places.sort_by! {|pl| pl[:distance]}
    end
    render json: @places
  end
end
