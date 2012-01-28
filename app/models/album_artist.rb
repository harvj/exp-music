class AlbumArtist < ActiveRecord::Base

  belongs_to :artist
  belongs_to :release
  
end
