class AddTrackToTrackHistoryItem < ActiveRecord::Migration[5.0]
  def change
    add_column :track_history_items, :track_id, :integer
    add_column :track_history_items, :user_id, :integer
  end
end
