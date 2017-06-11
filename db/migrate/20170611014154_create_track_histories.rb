class CreateTrackHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :track_histories do |t|

      t.timestamps
    end
  end
end
