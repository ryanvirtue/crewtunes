class DashboardController < ApplicationController

  before_action :authenticate_user!
  include HTTParty

  def index
    access_token_request = HTTParty.post('https://accounts.spotify.com/api/token',
      body: {
        grant_type: 'client_credentials',
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      })
    gon.access_token = access_token_request.parsed_response['access_token']
  end

  def search
    results = HTTParty.get("https://api.spotify.com/v1/search?q=#{params[:q]}&type=artist,track")
    puts results
  end
end
