class VenuesController < ApplicationController

  def result
    @search_result = HTTParty.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:search]}&count=10", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
    @venueID = @search_result['restaurants'][0]['restaurant']['id']
  end

  def show
    @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:venueID]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
  end

  def create
    @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:venueID]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
    venue = Venue.new
    venue.name = @select_venue['restaurants'][0]['restaurant']['name']
    venue.city = @select_venue['restaurants'][0]['restaurant']["location"]['city']
    venue.cusine = @select_venue['restaurants'][0]['restaurant']['cusines']
    venue.rating = @select_venue['restaurants'][0]['restaurant']['user_rating']['aggregate_rating']
    venue.venueID = @select_venue['restaurants'][0]['restaurant']['id']
    venue.user_id = current_user.id
    venue.save
    redirect_to '/home'
    return
  end


end
