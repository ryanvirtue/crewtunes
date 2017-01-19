class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def search
    results = HTTParty.get("https://api.spotify.com/v1/search?q=#{params[:q]}&type=artist,track")
    puts results
  end
end
