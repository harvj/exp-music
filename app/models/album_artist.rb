class AlbumArtist < ActiveRecord::Base

  belongs_to :artist
  accepts_nested_attributes_for :artist

  belongs_to :release
  accepts_nested_attributes_for :release
  
end
