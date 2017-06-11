class CreateTrackHistoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :track_history_items do |t|

      t.timestamps
    end
  end
end
