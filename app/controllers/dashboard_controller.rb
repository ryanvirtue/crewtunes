class DashboardController < ApplicationController

  before_action :authenticate_user!
  include HTTParty

  def index
    @track_history = TrackHistoryItem.where(user_id: current_user.id).includes(:track, :artist)
    get_spotify_access_token
  end

  def search
    results = HTTParty.get("https://api.spotify.com/v1/search?q=#{params[:q]}&type=artist,track")
    puts results
  end

end
