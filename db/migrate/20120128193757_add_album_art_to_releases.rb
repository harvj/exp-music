class AddAlbumArtToReleases < ActiveRecord::Migration
  def up
    add_column :releases, :album_art, :string
    remove_column :album_artists, :primary
  end

  def down
    remove_column :releases, :album_art
    add_column :album_artists, :primary, :boolean
  end
end
