class SiteController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.server_ip = ENV['SERVER_IP']
    gon.server_port = ENV['SERVER_PORT']
  end
end
