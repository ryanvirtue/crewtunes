class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    gon.server_ip = ENV['SERVER_IP']
    gon.server_port = ENV['SERVER_PORT']
  end

  def search
    results = HTTParty.get("https://api.spotify.com/v1/search?q=#{params[:q]}&type=artist,track")
    puts results
  end
end
