class AddPlayedAtColumnToTrackHistoryItems < ActiveRecord::Migration[5.0]
  def change
    add_column :track_history_items, :played_at, :datetime
  end
end
