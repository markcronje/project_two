class VenuesController < ApplicationController


  def remove_from_list
    Venue.find(params[:id]).update(:top10 => false)
    redirect_to mytop10_path
  end

  def index
    @search_result = HTTParty.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:search]}&count=10", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
    @venueID = @search_result['restaurants'][0]['restaurant']['id']
  end


  def show
    @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:venueID]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
  end


  def create
  @select_venue = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:ID]}", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
  venue = Venue.new
  venue.name = @select_venue['restaurants'][0]['restaurant']['name']
  venue.city = @select_venue['restaurants'][0]['restaurant']["location"]['city']
  venue.category = @select_venue['restaurants'][0]['restaurant']['cuisines']
  venue.rating = @select_venue['restaurants'][0]['restaurant']['user_rating']['aggregate_rating']
  venue.venueID = @select_venue['restaurants'][0]['restaurant']['id']
  venue.users_id = current_user.id

  venue.save
    if venue.save
      flash[:message] = "Added to list"
      redirect_to '/home'

    end
  end



  def list
    @user = User.find(current_user.id)
  end
end
