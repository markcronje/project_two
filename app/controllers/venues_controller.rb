class VenuesController < ApplicationController

  def result
    search_result = HTTParty.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:search]}&count=10", :headers => {"X-Zomato-API-Key" => "228c037c226e4f7fdac58a2a97f123dc"})
    @search_result = search_result
  end

  def create

  end

end
