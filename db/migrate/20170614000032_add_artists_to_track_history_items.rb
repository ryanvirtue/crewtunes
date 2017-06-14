class AddArtistsToTrackHistoryItems < ActiveRecord::Migration[5.0]
  def change
    add_column :track_history_items, :artist_id, :integer
  end
end
