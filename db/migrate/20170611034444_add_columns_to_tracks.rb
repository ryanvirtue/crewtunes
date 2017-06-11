class AddColumnsToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :name, :string
    add_column :tracks, :spotify_id, :string
    add_column :tracks, :spotify_uri, :string
    add_column :tracks, :spotify_href, :string
    add_column :tracks, :artist_id, :integer
  end
end
