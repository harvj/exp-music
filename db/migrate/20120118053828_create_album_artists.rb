class CreateAlbumArtists < ActiveRecord::Migration
  def change
    create_table :album_artists do |t|
      t.boolean :primary
      t.integer :release_id
      t.integer :artist_id
      t.timestamps
    end
    add_index :album_artists, :release_id
    add_index :album_artists, :artist_id

  end
end
