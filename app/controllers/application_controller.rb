class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :server_constants, :spotify_api_credentials

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
end
