class VenuesController < ApplicationController





  def index
    @search_result = HTTParty.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:search]}&count=10", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
  end


  def show
    @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:venueID]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
  end


  def create
    @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{params[:venue_id]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
    venue = Venue.new
    venue.name = @select_venue['restaurants'][0]['restaurant']['name']
    venue.city = @select_venue['restaurants'][0]['restaurant']["location"]['city']
    venue.category = @select_venue['restaurants'][0]['restaurant']['cuisines']
    venue.rating = @select_venue['restaurants'][0]['restaurant']['user_rating']['aggregate_rating']
    venue.venueID = @select_venue['restaurants'][0]['restaurant']['id']
    venue.user = current_user

    if venue.save
      flash[:message] = "Added to list"
      redirect_to '/result'
    end
  end


  def list
    @user = User.find(current_user.id)
  end
end
