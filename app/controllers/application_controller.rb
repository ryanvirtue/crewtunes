class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :server_constants, :spotify_api_credentials, :get_spotify_access_token

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def server_constants
    gon.server_ip = ENV['SERVER_IP']
    gon.server_port = ENV['SERVER_PORT']
  end

  def spotify_api_credentials
    gon.client_id = ENV['CLIENT_ID']
    gon.client_secret = ENV['CLIENT_SECRET']
  end

  def get_spotify_access_token
    access_token_request = HTTParty.post('https://accounts.spotify.com/api/token',
      body: {
        grant_type: 'client_credentials',
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      })
    gon.access_token = access_token_request.parsed_response['access_token']
  end

end
