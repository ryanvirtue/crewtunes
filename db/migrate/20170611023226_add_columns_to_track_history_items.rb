class AddColumnsToTrackHistoryItems < ActiveRecord::Migration[5.0]
  def change
    add_column :track_history_items, :name, :string
    add_column :track_history_items, :spotify_id, :string
    add_column :track_history_items, :spotify_uri, :string
    add_column :track_history_items, :spotify_href, :string
  end
end
