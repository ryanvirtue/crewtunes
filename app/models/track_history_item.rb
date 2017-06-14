class TrackHistoryItem < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :track
end
