class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :spotify_uri
      t.string :spotify_id
      t.string :spotify_href
      t.string :small_image_url
      t.string :large_image_url
      t.timestamps
    end
  end
end
