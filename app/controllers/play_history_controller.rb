class PlayHistoryController < ApplicationController

  def create_history_item
    @user_id = current_user.id
    find_or_create_artist
    find_or_create_track
    TrackHistoryItem.new(track_id: @track.id, user_id: @user_id, artist_id: @artist.id).save!
  end

  def find_or_create_track
    @track = Track.find_or_create_by(spotify_id: params['track_data']['id']) do |track|
      track.spotify_uri =   params['track_data']['spotify_uri']
      track.spotify_href =  params['track_data']['spotify_href']
      track.name =          params['track_data']['name']
      track.artist_id =     @artist.id
    end
  end

  def find_or_create_artist
    @artist = Artist.find_or_create_by(spotify_id: params['track_data']['artist_spotify_id']) do |artist|
      artist.spotify_uri =  params['track_data']['artist_spotify_uri']
      artist.spotify_href = params['track_data']['artist_spotify_href']
      artist.name =         params['track_data']['artist_name']
    end
  end

end
